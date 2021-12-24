CREATE OR REPLACE FUNCTION aws_oracle_ext.regexp_instr(IN p_src_string TEXT,
                                                       IN p_regexp_pat TEXT,
                                                       IN p_position NUMERIC DEFAULT 1,
                                                       IN p_occurrence NUMERIC DEFAULT 1,
                                                       IN p_retopt NUMERIC DEFAULT 0,
                                                       IN p_match_param TEXT DEFAULT 'c')
RETURNS INTEGER
AS
$function$
DECLARE
    v_retopt INTEGER;
    v_position INTEGER;
    v_occurrence INTEGER;
    v_match_param TEXT;
    v_src_string TEXT;
    v_instr_pos INTEGER;
    v_srcstr_len INTEGER;
    v_resposition INTEGER;
    v_regexpres_row RECORD;
    v_match_count INTEGER := 0;
BEGIN
    -- Extracting INT value of position
    v_position := floor(p_position);

    -- Preparing source string for further work
    v_src_string := substr(p_src_string, v_position);

    -- Extracting INT value of occurrence
    v_occurrence := floor(p_occurrence);

    -- Extracting INT value of return option
    v_retopt := floor(p_retopt);

    -- Removing spaces from match_param
    v_match_param := trim(p_match_param);

    v_srcstr_len := char_length(v_src_string);

    -- Block of input parameters validation checks
    IF (coalesce(p_src_string, '') = '' OR
        coalesce(p_regexp_pat, '') = '' OR
        p_position IS NULL OR
        p_occurrence IS NULL OR
        p_retopt IS NULL)
    THEN
        RETURN NULL;
    ELSIF (v_position <= 0) THEN
        /* The value of the argument for parameter in position "3" (start position)
           should be greater than or equal to 1 */
        RAISE USING MESSAGE := format('Argument ''%s'' is out of range.', v_position),
                    DETAIL := 'The value of the argument should be greater than or equal to 1.',
                    HINT := '-1428';
    ELSIF (v_occurrence <= 0) THEN
        /* The value of the argument for parameter in position "4" (occurrence of match)
           should be greater than or equal to 1 */
        RAISE USING MESSAGE := format('Argument ''%s'' is out of range.', v_position),
                    DETAIL := 'The value of the argument should be greater than or equal to 1.',
                    HINT := '-1428';
    ELSIF (v_retopt < 0) THEN
        /* The value of the argument for parameter in position "5" (return option)
           should be either 0 or 1 */
        RAISE USING MESSAGE := format('Argument ''%s'' is out of range.', v_retopt),
                    DETAIL := 'The value of the argument should be either 0 or 1.',
                    HINT := '-1428';
    ELSIF (coalesce(v_match_param, '') = '') THEN
        v_match_param := 'c';
    ELSIF (v_match_param !~ 'i|c|n|m|x') THEN
        /* The value of the argument for parameter in position "6" (match parameter)
           must be one of the following: "i", "c", "n", "m", "x" */
        RAISE USING MESSAGE := 'Illegal argument for function.',
                    DETAIL := 'The value of the argument must be one of the following: "i", "c", "n", "m", "x".',
                    HINT := '-1760';
    END IF;

    -- Translate regexp flags (match parameter) between matching engines
    v_match_param := concat('g', v_match_param);
    v_match_param := regexp_replace(v_match_param, 'm|x', '', 'g');
    v_match_param := CASE
                        WHEN v_match_param !~ 'n' THEN v_match_param || 'p'
                        ELSE regexp_replace(v_match_param, 'n', '', 'g')
                     END;

    -- Find the position of the particular occurrence of the regexp match
    FOR v_regexpres_row IN
    (SELECT rownum,
            regexpval,
            char_length(regexpval) AS value_len
       FROM (SELECT ROW_NUMBER() OVER (ORDER BY 1) AS rownum,
                    regexpval
               FROM (SELECT unnest(regexp_matches(v_src_string,
                                                  p_regexp_pat,
                                                  v_match_param)) AS regexpval
                    ) AS regexpvals
              WHERE char_length(regexpval) > 0
            ) AS rankexpvals
      ORDER BY rownum ASC)
    LOOP
        v_src_string := substr(v_src_string, strpos(v_src_string, v_regexpres_row.regexpval) + v_regexpres_row.value_len);
        v_resposition := v_srcstr_len - char_length(v_src_string) - v_regexpres_row.value_len + 1;

        IF (v_position > 1) THEN
            v_resposition := v_resposition + v_position - 1;
        END IF;

        IF (v_retopt > 0) THEN
            v_resposition := v_resposition + v_regexpres_row.value_len;
        END IF;

        v_match_count := v_regexpres_row.rownum;
        EXIT WHEN v_match_count = v_occurrence;
    END LOOP;

    v_instr_pos := CASE
                      WHEN v_match_count != v_occurrence THEN 0
                      ELSE v_resposition
                   END;

    RETURN v_instr_pos;
END;
$function$
LANGUAGE plpgsql
IMMUTABLE;
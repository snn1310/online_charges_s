CREATE OR REPLACE FUNCTION aws_oracle_ext.regexp_count(IN p_src_string TEXT,
                                                       IN p_regexp_pat TEXT,
                                                       IN p_position NUMERIC DEFAULT 1,
                                                       IN p_match_param TEXT DEFAULT 'c')
RETURNS INTEGER
AS
$function$
DECLARE
    v_res_count INTEGER;
    v_position INTEGER;
    v_match_param TEXT;
    v_src_string TEXT;
BEGIN
    -- Extracting INT value of position
    v_position := floor(p_position);

    -- Removing spaces from match_param
    v_match_param := trim(p_match_param);

    -- Preparing source string for further work
    v_src_string := substr(p_src_string, v_position);

    -- Block of input parameters validation checks
    IF (coalesce(p_src_string, '') = '' OR
        coalesce(p_regexp_pat, '') = '' OR
        p_position IS NULL)
    THEN
        RETURN NULL;
    ELSIF (v_position <= 0) THEN
        /* The value of the argument for parameter in position "3" (start position)
           should be greater than or equal to 1 */
        RAISE USING MESSAGE := format('Argument ''%s'' is out of range.', v_position),
                    DETAIL := 'The value of the argument should be greater than or equal to 1.',
                    HINT := '-1428';
    ELSIF (coalesce(v_match_param, '') = '') THEN
        v_match_param := 'c';
    ELSIF (v_match_param !~ 'i|c|n|m|x') THEN
        /* The value of the argument for parameter in position "4" (match parameter)
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

    -- Find the count of matches which correspond to the supplied regexp mask
    SELECT COUNT(regexpval)::INTEGER
      INTO v_res_count
      FROM (SELECT ROW_NUMBER() OVER (ORDER BY 1) AS rownum,
                   regexpval
              FROM (SELECT unnest(regexp_matches(v_src_string,
                                                 p_regexp_pat,
                                                 v_match_param)) AS regexpval
                   ) AS regexpvals
             WHERE char_length(regexpval) > 0
           ) AS rankexpvals;

    RETURN v_res_count;
END;
$function$
LANGUAGE plpgsql
IMMUTABLE;
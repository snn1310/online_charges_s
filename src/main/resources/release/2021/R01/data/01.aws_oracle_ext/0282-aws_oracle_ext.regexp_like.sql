CREATE OR REPLACE FUNCTION aws_oracle_ext.regexp_like(IN p_src_string TEXT,
                                                      IN p_regexp_pat TEXT,
                                                      IN p_match_param TEXT DEFAULT 'c')
RETURNS BOOLEAN
AS
$function$
DECLARE
    v_match_param TEXT;
    v_like_flag BOOLEAN := FALSE;
BEGIN
    -- Removing spaces from match_param
    v_match_param := trim(p_match_param);

    -- Block of input parameters validation checks
    IF (coalesce(p_src_string, '') = '' OR
        coalesce(p_regexp_pat, '') = '')
    THEN
        RETURN v_like_flag;
    ELSIF (coalesce(v_match_param, '') = '') THEN
        v_match_param := 'c';
    ELSIF (v_match_param !~ 'i|c|n|m|x') THEN
        /* The value of the argument for parameter in position "3" (match parameter)
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

    -- Finding if there is a match regarding supplied regexp mask
    v_like_flag := EXISTS(SELECT regexp_matches(p_src_string, p_regexp_pat, v_match_param));

    RETURN v_like_flag;
END;
$function$
LANGUAGE plpgsql
IMMUTABLE;
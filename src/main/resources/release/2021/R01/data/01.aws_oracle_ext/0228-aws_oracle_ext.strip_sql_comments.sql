CREATE OR REPLACE FUNCTION aws_oracle_ext.strip_sql_comments(IN p_sql_statement TEXT,
                                                             IN p_skip_hints BOOLEAN DEFAULT FALSE,
                                                             IN p_adv_quote_tags TEXT[] DEFAULT ARRAY[''],
                                                             IN p_validate_multiline BOOLEAN DEFAULT FALSE)
RETURNS TEXT
AS
$function$
DECLARE
    i_tag RECORD;
    v_tag_pos INTEGER;
    v_tag_len INTEGER;
    v_adv_tag TEXT;
    v_reversed_sql TEXT;
    v_sql_statement TEXT;
    i_multi_comment RECORD;
    v_unpaired_cnt INTEGER;
    v_comm_startpos INTEGER;
    v_comm_endpos INTEGER;
    v_comm_length INTEGER;
    v_adv_quote_tags TEXT[];
    v_adv_tag_idx INTEGER[];
    v_idx_offset INTEGER := 0;
    v_hints_single_regexp TEXT;
    v_hints_multi_regexp TEXT;
    v_hints_list_regexp TEXT;
    v_dml_multi_regexp TEXT;
    v_singlecomm_cnt INTEGER;
    v_adv_quote_tag_cnt INTEGER;
    v_left_multicomm_cnt INTEGER;
    v_right_multicomm_cnt INTEGER;
    v_adv_quote_tag_idx TEXT[];
    v_single_comm_idx INTEGER[];
    v_literal_start_idx INTEGER[];
    v_literal_end_idx INTEGER[];
    v_left_multicomm_idx INTEGER[];
    v_right_multicomm_idx INTEGER[];
    v_ambiguously_comm_pos INTEGER;
    v_within_literal_res SMALLINT := 0;
    v_dml_keywords_regexp CONSTANT TEXT := 'SELECT|INSERT|UPDATE|DELETE|MERGE';
    -- Full list of Oracle Database Optimizer Hints
    v_hints_list CONSTANT TEXT[] := ARRAY['ALL_ROWS', 'FIRST_ROWS', 'FIRST_ROWS_1', 'FIRST_ROWS_100', 'CHOOSE', 'RULE', 'NO_PUSH_PRED',
                                          'CLUSTER', 'FULL', 'HASH', 'ROWID', 'INDEX', 'NO_INDEX', 'INDEX_ASC', 'INDEX_DESC', 'USE_NL',
                                          'INDEX_COMBINE', 'INDEX_FFS', 'ORDERED', 'ORDERED_PREDICATES', 'STAR', 'DRIVING_SITE', 'NL_SJ',
                                          'HASH_SJ', 'MERGE_SJ', 'LEADING', 'USE_HASH', 'USE_MERGE', 'NOPARALLEL', 'PARALLEL_INDEX',
                                          'PARALLEL', 'PQ_DISTRIBUTE', 'NOPARALLEL_INDEX', 'STAR_TRANSFORMATION', 'USE_NL_WITH_INDEX',
                                          'NO_EXPAND', 'FACT', 'NOFACT', 'MERGE', 'NO_MERGE', 'REWRITE', 'NOREWRITE', 'USE_CONCAT',
                                          'APPEND', 'NOAPPEND', 'CACHE', 'NOCACHE', 'PUSH_PRED', 'AND_EQUAL', 'PUSH_SUBQ', 'NO_PUSH_SUBQ',
                                          'BYPASS_RECURSIVE_CHECK', 'BYPASS_UJVC', 'CACHE_CB', 'CACHE_TEMP_TABLE', 'CIV_GB',
                                          'COLLECTIONS_GET_REFS', 'CUBE_GB', 'CURSOR_SHARING_EXACT', 'DEREF_NO_REWRITE', 'DML_UPDATE',
                                          'DOMAIN_INDEX_NO_SORT', 'DOMAIN_INDEX_SORT', 'DYNAMIC_SAMPLING', 'DYNAMIC_SAMPLING_EST_CDN',
                                          'EXPAND_GSET_TO_UNION', 'FORCE_SAMPLE_BLOCK', 'GBY_CONC_ROLLUP', 'GLOBAL_TABLE_HINTS',
                                          'HWM_BROKERED', 'IGNORE_ON_CLAUSE', 'IGNORE_WHERE_CLAUSE', 'INDEX_RRS', 'INDEX_SS', 'UNNEST',
                                          'INDEX_SS_ASC', 'INDEX_SS_DESC', 'LIKE_EXPAND', 'LOCAL_INDEXES', 'MV_MERGE', 'NO_FILTERING',
                                          'NESTED_TABLE_GET_REFS', 'NESTED_TABLE_SET_REFS', 'NESTED_TABLE_SET_SETID', 'REMOTE_MAPPED',
                                          'NO_EXPAND_GSET_TO_UNION', 'NO_FACT', 'NO_ORDER_ROLLUPS', 'NO_PRUNE_GSETS', 'NO_STATS_GSETS',
                                          'NO_UNNEST', 'NOCPU_COSTING OVERFLOW_NOMOVE', 'PIV_GB', 'PIV_SSF', 'PQ_MAP', 'SCN_ASCENDING',
                                          'RESTORE_AS_INTERVALS', 'SAVE_AS_INTERVALS', 'SKIP_EXT_OPTIMIZER', 'PQ_NOMAP', 'TIV_SSF',
                                          'USE_TTT_FOR_GSETS', 'SQLLDR', 'SYS_DL_CURSOR', 'SYS_PARALLEL_TXN', 'SYS_RID_ORDER', 'PQ_SKEW',
                                          'HASH_AJ', 'INDEX_JOIN', 'NO_INDEX_FFS', 'NO_INDEX_SS', 'NO_QUERY_TRANSFORMATION', 'BITMAP',
                                          'NO_STAR_TRANSFORMATION', 'NO_USE_NL', 'NO_USE_MERGE', 'NO_USE_HASH', 'NO_PARALLEL', 'NL_AJ',
                                          'NO_PARALLEL_INDEX', 'QB_NAME', 'SPREAD_MIN_ANALYSIS', 'MERGE_AJ', 'NO_REWRITE', 'NO_USE_BAND',
                                          'CLUSTERING', 'NO_CLUSTERING', 'NATIVE_FULL_OUTER_JOIN', 'NO_NATIVE_FULL_OUTER_JOIN', 'TIV_GB',
                                          'NO_ZONEMAP', 'USE_BAND', 'NO_INMEMORY_PRUNING', 'INMEMORY_PRUNING', 'NO_PQ_CONCURRENT_UNION',
                                          'ENABLE_PARALLEL_DML', 'DISABLE_PARALLEL_DML', 'PQ_CONCURRENT_UNION', 'USE_CUBE', 'INMEMORY',
                                          'CHANGE_DUPKEY_ERROR_INDEX', 'IGNORE_ROW_ON_DUPKEY_INDEX', 'RETRY_ON_ROW_CHANGE', 'PQ_FILTER',
                                          'GATHER_OPTIMIZER_STATISTICS', 'NO_GATHER_OPTIMIZER_STATISTICS', 'GROUPING', 'PX_JOIN_FILTER',
                                          'MODEL_MIN_ANALYSIS', 'NO_PX_JOIN_FILTER', 'NO_XMLINDEX_REWRITE', 'NO_XML_QUERY_REWRITE',
                                          'NO_PQ_SKEW', 'APPEND_VALUES', 'CONTAINERS', 'NOCACHE', 'FRESH_MV', 'MONITOR', 'NO_MONITOR',
                                          'OPT_PARAM', 'CACHE', 'NOCACHE', 'NO_USE_CUBE', 'NO_INMEMORY'];
BEGIN
    v_sql_statement := trim(p_sql_statement);

    -- Checking for ambiguously defined multi-line comments
    v_ambiguously_comm_pos := position('*/*' in v_sql_statement);

    IF (v_ambiguously_comm_pos > 0) THEN
        RAISE escape_character_conflict;
    END IF;

    -- Composing complete hints regexp (HINT1|HINT2|HINTn)
    v_hints_list_regexp := array_to_string(v_hints_list, '|');

    IF (p_skip_hints) THEN
        v_dml_multi_regexp := format('(%s)\s*$', v_dml_keywords_regexp);
        v_hints_multi_regexp := format('^/\*\+\s*(%s)', v_hints_list_regexp);

        -- Composing regexp to remove single-line comments but skip Optimizer Hints
        v_hints_single_regexp := format('(?<!(?:%s)\s*)--\+\s*(%s).*|(?<=(?:%s)\s*)--\+(?!\s*(?:%s)).*|(?<=(?:\s*))--(?!\+).*',
                                        v_dml_keywords_regexp,
                                        v_hints_list_regexp,
                                        v_dml_keywords_regexp,
                                        v_hints_list_regexp);
    ELSE
        v_hints_single_regexp := '\s*--.*';
    END IF;

    -- Removing distinct and NULL values
    SELECT array_agg(DISTINCT adv_quote_tag)
      INTO v_adv_quote_tags
      FROM unnest(p_adv_quote_tags) tags (adv_quote_tag)
     WHERE adv_quote_tag IS NOT NULL;

    -- Determining the count of advanced quoting tags
    v_adv_quote_tag_cnt := coalesce(array_length(v_adv_quote_tags, 1), 0);

    IF (v_adv_quote_tag_cnt > 0)
    THEN
        -- Determining positions of each advanced quoting tag ($q$, $Q$, ...)
        FOREACH v_adv_tag IN ARRAY v_adv_quote_tags
        LOOP
            v_idx_offset := 0;
            v_adv_tag_idx := '{}'::INTEGER[];

            v_tag_len = char_length(v_adv_tag);
            v_tag_pos = position(v_adv_tag IN v_sql_statement);

            WHILE (v_tag_pos > 0)
            LOOP
                v_idx_offset := v_idx_offset + v_tag_pos;

                IF (aws_oracle_ext.regexp_count(substring(v_sql_statement, v_idx_offset), '''') % 2 = 1)
                THEN
                    v_idx_offset := v_idx_offset + v_tag_len;
                    v_tag_pos = position(v_adv_tag IN substring(v_sql_statement, v_idx_offset)) - 1;

                    CONTINUE;
                END IF;

                v_adv_tag_idx := array_append(v_adv_tag_idx, v_idx_offset);

                v_idx_offset := v_idx_offset + v_tag_len;
                v_tag_pos = position(v_adv_tag IN substring(v_sql_statement, v_idx_offset)) - 1;
            END LOOP;

            v_adv_quote_tag_idx := array_append(v_adv_quote_tag_idx, array_to_string(v_adv_tag_idx, ','));
            v_adv_tag_idx := '{}'::INTEGER[];
            v_adv_tag := NULL;
        END LOOP;

        -- Merging advanced quoting ($q$..$q$) sections
        FOR i_tag IN
        (WITH adv_quote_tags AS (
         SELECT tags,
                generate_subscripts(tags, 1) tag_num
           FROM (VALUES (v_adv_quote_tags)) adv_quote_tags (tags)
         ),
         adv_quote_tag_idx AS (
         SELECT tags[tag_num] tag,
                unnest(string_to_array((v_adv_quote_tag_idx)[tag_num], ','))::INTEGER tag_idx
           FROM adv_quote_tags
          ORDER BY tag_idx ASC)

         SELECT ROW_NUMBER() OVER (ORDER BY tag_idx) tag_num,
                tag_idx.*
           FROM adv_quote_tag_idx tag_idx)
        LOOP
            IF (v_adv_tag IS NULL)
            THEN
                v_adv_tag := i_tag.tag;
                v_literal_start_idx := array_append(v_literal_start_idx, i_tag.tag_idx);

                CONTINUE;
            END IF;

            CONTINUE WHEN i_tag.tag <> v_adv_tag;

            v_literal_end_idx := array_append(v_literal_end_idx,
                                              i_tag.tag_idx + char_length(v_adv_tag));
            v_adv_tag := NULL;
        END LOOP;

        -- Rearming offset
        v_idx_offset := 0;
    END IF;

    -- Counting single-line comments in SQL statement
    SELECT COUNT(1)
      INTO v_singlecomm_cnt
      FROM regexp_matches(v_sql_statement, '--', 'ngi');

    -- Searching for `literal` single-line comments
    FOR i_comment_num IN 1..v_singlecomm_cnt
    LOOP
        v_comm_startpos := aws_oracle_ext.regexp_instr(v_sql_statement, '--', p_occurrence => i_comment_num);

        -- Single-line comment is part of a string literal (single quotes)
        IF (aws_oracle_ext.regexp_count(v_sql_statement, '''', v_comm_startpos) % 2 = 1)
        THEN
            v_single_comm_idx := array_append(v_single_comm_idx, v_comm_startpos);

            CONTINUE;
        ELSIF (v_adv_quote_tag_cnt > 0) THEN
            SELECT COUNT(1)
              INTO v_within_literal_res
              FROM unnest(v_literal_start_idx,
                          v_literal_end_idx) adv_tag_positions (tag_start, tag_end)
             WHERE v_comm_startpos BETWEEN tag_start + 1
                                       AND tag_end;

            -- Single-line comment is part of a string literal (advanced quoting)
            IF (coalesce(v_within_literal_res, 0) > 0)
            THEN
                v_single_comm_idx := array_append(v_single_comm_idx, v_comm_startpos);

                CONTINUE;
            END IF;
        END IF;

        v_reversed_sql := reverse(substring(v_sql_statement, 1, v_comm_startpos));

        -- Single-line comment located inside multi-line comment
        IF (v_comm_startpos - CASE
                                 WHEN position('*/' in v_reversed_sql) = 0 THEN v_comm_startpos
                                 ELSE position('*/' in v_reversed_sql)
                              END > CASE
                                       WHEN position('/*' in v_reversed_sql) = 0 THEN 0
                                       ELSE v_comm_startpos
                                    END - position('/*' in v_reversed_sql))
        THEN
            v_single_comm_idx := array_append(v_single_comm_idx, v_comm_startpos);
        END IF;
    END LOOP;

    FOR i_comment_num IN 1..coalesce(array_length(v_single_comm_idx, 1), 0)
    LOOP
        -- Masking `literal` single-line comments with "<_($-$$-$)_>"
        v_sql_statement := overlay(v_sql_statement placing '<_($-$$-$)_>' -- 10 = length('<_($-$$-$)_>') - length('--')
                                                      from (v_single_comm_idx[i_comment_num] + (i_comment_num - 1) * 10)
                                                       for 2);
    END LOOP;

    -- Removing non-masked single-line comments
    v_sql_statement := regexp_replace(v_sql_statement, v_hints_single_regexp, '', 'ngi');

    -- Restoring masked single-line comments back to its originals
    v_sql_statement := replace(v_sql_statement, '<_($-$$-$)_>', '--');

    SELECT COUNT(1)
      INTO v_left_multicomm_cnt
      FROM regexp_matches(v_sql_statement, '/\*', 'ngi');

    FOR i_comment_num IN 1..v_left_multicomm_cnt
    LOOP
        v_within_literal_res := 0;
        v_comm_startpos := aws_oracle_ext.regexp_instr(v_sql_statement, '/\*', p_occurrence => i_comment_num);

        IF (v_adv_quote_tag_cnt > 0)
        THEN
            SELECT COUNT(1)
              INTO v_within_literal_res
              FROM unnest(v_literal_start_idx,
                          v_literal_end_idx) adv_tag_positions (tag_start, tag_end)
             WHERE v_comm_startpos BETWEEN tag_start + 1
                                       AND tag_end;

            v_within_literal_res := coalesce(v_within_literal_res, 0);
        END IF;

        -- Skip multi-line comments found inside string literals
        IF (aws_oracle_ext.regexp_count(v_sql_statement, '''', v_comm_startpos) % 2 = 0 AND v_within_literal_res = 0)
        THEN
            v_left_multicomm_idx := array_append(v_left_multicomm_idx, v_comm_startpos);
        END IF;
    END LOOP;

    SELECT COUNT(1)
      INTO v_right_multicomm_cnt
      FROM regexp_matches(v_sql_statement, '\*/', 'ngi');

    FOR i_comment_num IN 1..v_right_multicomm_cnt
    LOOP
        v_within_literal_res := 0;
        v_comm_endpos := aws_oracle_ext.regexp_instr(v_sql_statement, '\*/', p_occurrence => i_comment_num);

        IF (v_adv_quote_tag_cnt > 0)
        THEN
            SELECT COUNT(1)
              INTO v_within_literal_res
              FROM unnest(v_literal_start_idx,
                          v_literal_end_idx) adv_tag_positions (tag_start, tag_end)
             WHERE v_comm_endpos BETWEEN tag_start + 1
                                     AND tag_end;

            v_within_literal_res := coalesce(v_within_literal_res, 0);
        END IF;

        -- Skip multi-line comments found inside string literals
        IF (aws_oracle_ext.regexp_count(v_sql_statement, '''', v_comm_endpos) % 2 = 0 AND v_within_literal_res = 0)
        THEN
            v_right_multicomm_idx := array_append(v_right_multicomm_idx, v_comm_endpos);
        END IF;
    END LOOP;

    -- Removing multi-line comments
    FOR i_multi_comment IN
    (WITH src_data AS (
     SELECT left_part,
            right_part,
            coalesce(LAG(right_part, 1) OVER (ORDER BY right_part), 0) prev_right
       FROM unnest(v_left_multicomm_idx,
                   v_right_multicomm_idx) AS src (left_part, right_part)
     ),
     pair_set AS (
     SELECT (SELECT MIN(left_part)
               FROM src_data src2
              WHERE src2.left_part < src1.right_part
                AND src2.left_part > src1.prev_right
            ) left_part,
            src1.right_part
       FROM src_data src1
     UNION ALL
     SELECT left_part,
            NULL
       FROM src_data
      WHERE left_part > (SELECT MAX(right_part)
                           FROM src_data))
     SELECT *
       FROM pair_set
      WHERE NOT (left_part IS NULL AND
                 right_part IS NULL))
    LOOP
        v_comm_startpos := i_multi_comment.left_part;
        v_comm_endpos := i_multi_comment.right_part + 2; -- length of "*/"

        -- Checking if there are any unpaired multi-line comments
        IF (coalesce(v_comm_startpos, v_comm_endpos) = v_comm_endpos OR
            coalesce(v_comm_endpos, v_comm_startpos) = v_comm_startpos)
        THEN
            IF (p_validate_multiline) THEN
                -- Found unpaired multi-line comment
                RAISE invalid_xml_comment;
            ELSE
                CONTINUE;
            END IF;
        ELSIF (p_skip_hints) THEN
            IF (substring(v_sql_statement, 1, v_comm_startpos - v_idx_offset - 1) ~* v_dml_multi_regexp AND
                substring(v_sql_statement, v_comm_startpos - v_idx_offset) ~* v_hints_multi_regexp)
            THEN
                -- Skip hint removal
                CONTINUE;
            END IF;
        END IF;

        -- Offsetting comment start/stop indexes
        v_comm_length := v_comm_endpos - v_comm_startpos;
        v_comm_startpos := v_comm_startpos - v_idx_offset;
        v_idx_offset := v_idx_offset + v_comm_length - 1;

        -- Removing multi-line comment by substituting it with a space symbol
        v_sql_statement := overlay(v_sql_statement placing ' ' from v_comm_startpos
                                                       for v_comm_length);
    END LOOP;

    /* Removing any unnecessary blank strings and spaces
       from the beginning and the end of SQL statement */
    RETURN regexp_replace(v_sql_statement, '^\s*(?=\S*)|(?<=\S*)\s*$', '', 'gi');
EXCEPTION
    -- SQL statement contains ambiguously defined multi-line comment
    WHEN escape_character_conflict THEN
        RAISE USING MESSAGE := 'SQL statement contains ambiguously defined multi-line comment.',
                    DETAIL := format('Supplied SQL statement contains ambiguously defined (*/*) multi-line comment at position %s.', v_ambiguously_comm_pos),
                    HINT := 'Correct the SQL statement so that any multi-line comment opening\closing tag be explicitly defined.';
    -- SQL statement contains unpaired multi-line comment
    WHEN invalid_xml_comment THEN
        RAISE USING MESSAGE := 'SQL statement contains unpaired multi-line comment.',
                    DETAIL := 'Supplied SQL statement contains unpaired multi-line comment. Oracle error ''ORA-01742: comment not terminated properly''.',
                    HINT := 'Correct the SQL statement so that any multi-line comment has its own opening\closing tag.';
END;
$function$
LANGUAGE plpgsql
RETURNS NULL ON NULL INPUT;
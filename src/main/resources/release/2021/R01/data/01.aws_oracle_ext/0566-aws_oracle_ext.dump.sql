/*
DROP FUNCTION aws_oracle_ext.dump(p_expr "anyelement", p_fmt INTEGER, p_pos INTEGER, p_len INTEGER);
*/
CREATE OR REPLACE FUNCTION aws_oracle_ext.dump(p_expr "anyelement"
                                              ,p_fmt INTEGER DEFAULT NULL
                                              ,p_pos INTEGER DEFAULT NULL
                                              ,p_len INTEGER DEFAULT NULL)
RETURNS text
AS
$$
DECLARE
  result text;
  proname name;
  expr_hex bytea;
BEGIN
IF p_expr IS NULL THEN RETURN 'NULL'; END IF;

EXECUTE 'SELECT p.proname
           FROM pg_catalog.pg_proc p
      LEFT JOIN pg_catalog.pg_namespace n ON n.oid = p.pronamespace
          WHERE pg_catalog.pg_function_is_visible(p.oid)
            AND n.nspname = ''pg_catalog''
            AND p.proname LIKE ''%send''
            AND pg_catalog.pg_get_function_arguments(p.oid) = $1'
  INTO proname
 USING pg_typeof(p_expr)::text;

EXECUTE 'SELECT ' || proname || '($1)'
   INTO expr_hex
  USING p_expr;

SELECT ARRAY_TO_STRING(ARRAY_AGG(CONCAT(CASE
                                          WHEN p_fmt IN (8,1008) --OCT
                                          THEN aws_oracle_ext.to_oct(i)::text
                                          WHEN p_fmt IN (16,1016) --HEX
                                          THEN CASE
                                                 WHEN SUBSTRING(v,1,1) = '0' THEN SUBSTRING(v,2)
                                                 ELSE v
                                               END
                                          WHEN p_fmt IN (10,1010) --DEC
                                          THEN i::text
                                          WHEN p_fmt IN (17,1017) OR p_fmt < 0 --ASCII/HEX
                                          THEN CASE
                                                 WHEN i BETWEEN 1 AND 31 THEN '^' || CHR(i+64)
                                                 WHEN i BETWEEN 32 AND 126 THEN CHR(i)
                                                 ELSE v
                                               END
                                          ELSE i::text --DEC
                                        END
                                       ,',')
                                 )
                      ,'')
  FROM (SELECT v, i, row_number() OVER (ORDER BY rn DESC) AS rn
          FROM (SELECT v, aws_oracle_ext.hex_to_int(v) AS i, row_number() OVER () AS rn
                  FROM REGEXP_SPLIT_TO_TABLE(LTRIM(expr_hex::text, '\x')
                                            ,E'(?=(..)+$)') AS v) t
       ) t
 WHERE rn BETWEEN COALESCE(p_pos,1) AND COALESCE(p_pos,1) + COALESCE(p_len,rn) - 1
  INTO result;

SELECT 'Typ=' || pg_typeof(p_expr)::oid ||
       ' Len=' || pg_column_size(p_expr) ||
       CASE
         WHEN p_fmt > 1000
         THEN ' CharacterSet=' || (SELECT character_set_name FROM information_schema.character_sets)
         ELSE ''
       END
       || ': ' || RTRIM(result,',')
  INTO result;

RETURN result;
END
$$
LANGUAGE plpgsql
IMMUTABLE;

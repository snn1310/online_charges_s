--DROP FUNCTION aws_oracle_ext.instrb(text, text);
CREATE OR REPLACE FUNCTION aws_oracle_ext.instrb(text, text)
RETURNS integer
AS
$BODY$
  SELECT POSITION($2::bytea IN $1::bytea);
$BODY$
LANGUAGE SQL
RETURNS NULL ON NULL INPUT;
/*
CREATE OR REPLACE FUNCTION aws_oracle_ext.instrb
(
    p_str TEXT,
    p_substr TEXT,
    p_pos NUMERIC DEFAULT 1,
    p_occurancy NUMERIC DEFAULT 1
)
RETURNS NUMERIC AS
$BODY$


    SELECT
        CASE

            WHEN OCTET_LENGTH($1) = 0 OR OCTET_LENGTH($2) = 0 THEN NULL::NUMERIC

            WHEN TRUNC($4) = 0 THEN 1/TRUNC($4)

            WHEN $4 < 0 THEN SQRT($4)

            ELSE

                (

                    WITH RECURSIVE t(str, shift, pos, tail, o, n) AS 
                    (
                        SELECT CASE WHEN TRUNC($3) < 0 THEN REVERSE($1) ELSE $1 END AS str,
                            0 AS shift,
                            CASE WHEN TRUNC($3) < 0 THEN -1 * TRUNC($3)::INT ELSE TRUNC($3)::INT END AS pos,
                            CASE WHEN TRUNC($3) < 0 THEN REVERSE($1) ELSE $1 END AS tail,
                            0 AS o,
                            CASE WHEN TRUNC($3) < 0 THEN REVERSE($2) ELSE $2 END AS n
                        UNION ALL
                        SELECT str,
                            shift + pos AS shift,
                            POSITION(n::BYTEA IN SUBSTR(str::BYTEA, shift + pos)) AS pos,
                            CONVERT_FROM(SUBSTR(str::BYTEA, shift + pos),'UTF-8') AS tail,
                            o + 1 AS o,
                            n
                        FROM t
                        WHERE pos <> 0
                    )
                    ,r AS
                    (
                        SELECT t.str,
                            t.shift,
                            t.pos,
                            t.tail,
                            t.o,
                            CASE
                                WHEN TRUNC($3) > 0 THEN
                                    t.pos + t.shift - 1
                                ELSE
                                    OCTET_LENGTH(t.str) - t.pos - t.shift + 1
                            END cc
                        FROM t
                        WHERE t.o = TRUNC($4)
                        AND t.pos <> 0
                    )
                    SELECT COALESCE
                    (
                        (
                            SELECT r.cc
                            FROM r
                        ),
                        0
                    )::NUMERIC
                )

        END;

$BODY$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;
*/
/*
DROP FUNCTION aws_oracle_ext.instrb(
  p_str       text,
  p_substr    text,
  p_pos       numeric,
  p_occurancy numeric)
*/
/*
CREATE OR REPLACE FUNCTION aws_oracle_ext.instrb(
  p_str       text,
  p_substr    text,
  p_pos       numeric default null,
  p_occurancy numeric default null)
  RETURNS int AS
$BODY$
DECLARE
  l_res       int;
  l_pos       int;
  l_ind       int;
  v_flag      int default 0;
BEGIN
  IF p_occurancy < 0 THEN
    RAISE USING MESSAGE := CONCAT('argument ', p_occurancy,' is out of range');
  END IF;

  IF ABS(p_pos) > OCTET_LENGTH(p_str) THEN
    l_res := 0;
    RETURN l_res;
  END IF;

  IF p_pos < 0 THEN
    p_str := REVERSE(aws_oracle_ext.substrb(p_str,1, OCTET_LENGTH(p_str)+p_pos+1));
    p_pos := 1;
    v_flag := 1;
  END IF;

  IF COALESCE(p_pos, 0) = 0 THEN
    l_res := POSITION(p_substr::BYTEA IN p_str::BYTEA)/*STRPOS(p_str, p_substr)*/;
  ELSIF COALESCE(p_pos, 0) <> 0 AND COALESCE(p_occurancy, 0) = 0 THEN
    --l_res := STRPOS(SUBSTR(p_str, p_pos, OCTET_LENGTH(p_str) - (p_pos - 1)), p_substr);
    l_res := POSITION(p_substr::BYTEA IN aws_oracle_ext.substrb(p_str, p_pos, OCTET_LENGTH(p_str) - (p_pos - 1))::BYTEA);
    IF l_res > 0 THEN
      l_res := l_res + p_pos - 1;
    END IF;
  ELSE
    l_ind := 0;
    l_pos := p_pos;
    WHILE l_ind < p_occurancy
    LOOP
      --l_res := STRPOS(SUBSTR(p_str, l_pos, OCTET_LENGTH(p_str) - (l_pos - 1)), p_substr);
      l_res := POSITION(p_substr::BYTEA IN aws_oracle_ext.substrb(p_str, l_pos, OCTET_LENGTH(p_str) - (l_pos - 1))::BYTEA);
      IF l_res > 0 THEN
        l_res := l_res + l_pos - 1;
        l_pos := l_res + 1;
      ELSE
        EXIT;
      END IF;
      l_ind := l_ind + 1;
    END LOOP;
  END IF;

  IF v_flag = 1 and l_res <> 0 THEN
    l_res := OCTET_LENGTH(p_str)-l_res+1;
  END IF;

  RETURN l_res;
END;
$BODY$
LANGUAGE plpgsql;
*/
CREATE OR REPLACE FUNCTION aws_oracle_ext.to_base(IN p_dec NUMERIC, p_base IN NUMERIC)
RETURNS TEXT
AS
$BODY$
DECLARE
  l_str CHARACTER VARYING(255) DEFAULT '';
  l_num NUMERIC(78,1) DEFAULT p_dec;
  l_hex CHARACTER VARYING(16) DEFAULT '0123456789abcdef';
BEGIN
  IF TRUNC (p_dec) <> p_dec OR p_dec < 0
  THEN
    RAISE plpgsql_error;
  END IF;

  LOOP
    l_str := SUBSTR(l_hex, (MOD(l_num, p_base) + 1)::int, 1) || l_str;
    l_num := TRUNC(l_num / p_base);
    EXIT WHEN l_num = 0;
  END LOOP;

  RETURN l_str;
END;
$BODY$
LANGUAGE plpgsql
RETURNS NULL ON NULL INPUT;
CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_random$string(IN p_opt TEXT,
                                                             IN p_len NUMERIC)
RETURNS TEXT
AS
$BODY$
DECLARE
    v_srcdata VARCHAR;
BEGIN
    v_srcdata := 
        CASE upper(p_opt)
           WHEN 'L' THEN 'abcdefghijklmnopqrstuvwxyz'
           WHEN 'A' THEN 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
           WHEN 'X' THEN '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'
           WHEN 'P' THEN '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ:;,{}()[].*/\|?!@$&#-=_+<>"''`#%^~ '
           ELSE 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
        END;

    RETURN array_to_string(
        ARRAY(SELECT substring(v_srcdata from (ceil(random() * length(v_srcdata)))::INTEGER for 1)
                FROM generate_series(1, p_len::INTEGER)),
        '');
END;
$BODY$
LANGUAGE plpgsql
VOLATILE
RETURNS NULL ON NULL INPUT;



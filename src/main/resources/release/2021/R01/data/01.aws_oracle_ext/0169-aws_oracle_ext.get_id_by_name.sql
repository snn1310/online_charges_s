create or replace function aws_oracle_ext.get_id_by_name(object_name text) 
returns bigint as
$BODY$
declare res bigint;
begin
  execute concat('select x''', substring(encode(digest($1, 'sha1'), 'hex'), 1, 16), '''::bigint') into res;
  return res;  
end;
$BODY$
language plpgsql 
returns null on null input;

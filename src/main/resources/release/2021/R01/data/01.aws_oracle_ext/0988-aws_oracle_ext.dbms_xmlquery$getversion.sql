create or replace function aws_oracle_ext.dbms_xmlquery$getVersion()
 returns void
 language plpgsql
 set search_path = 'aws_oracle_ext'
as $$
begin
	raise notice '%', 'XSU Version                Owner         Timestamp';
    raise notice '%', '-------------------------- ------------- ----------------';
end; $$
create or replace function aws_oracle_ext.dbms_xmlgen$crIsOpened(pCr refcursor) returns boolean
language sql stable
as $$
  select exists(select 1 from pg_cursors where name = pCr::text);
$$
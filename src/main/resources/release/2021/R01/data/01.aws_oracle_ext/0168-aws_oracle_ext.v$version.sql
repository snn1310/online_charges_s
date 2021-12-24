create or replace view aws_oracle_ext.v$version as
select version() as banner;

comment on view aws_oracle_ext.v$version is 'V$VERSION emulation';
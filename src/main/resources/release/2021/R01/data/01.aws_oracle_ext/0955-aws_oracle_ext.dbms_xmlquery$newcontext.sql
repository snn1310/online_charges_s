create or replace function aws_oracle_ext.dbms_xmlquery$newcontext(sqlQuery text) returns numeric
language plpgsql
as $$
declare
    ctxSequence constant text := 'dbms_xmlquery$context$sequence';
    ctxQuery record;
    lnCurrval int := 0;
begin
    lnCurrval := coalesce(nullif(aws_oracle_ext.get_extpack_variable(variable_name => ctxSequence, missing_ok => true), ''), '-1')::integer;
	begin
        lnCurrval := lnCurrval + 1;
        perform aws_oracle_ext.set_extpack_variable(variable_name => ctxSequence, variable_value => lnCurrval::text);
        select Idx, ctxIdx, aws_oracle_ext.dbms_xmlquery$context2text(Idx, sqlQuery) ctx
          into ctxQuery
          from aws_oracle_ext.dbms_xmlquery$ctxHdl2uidRec(lnCurrval) as (Idx numeric, ctxIdx character varying);

        perform aws_oracle_ext.set_extpack_variable(variable_name => ctxQuery.ctxIdx, variable_value => ctxQuery.ctx);
    end;
    return ctxQuery.Idx;
end; $$

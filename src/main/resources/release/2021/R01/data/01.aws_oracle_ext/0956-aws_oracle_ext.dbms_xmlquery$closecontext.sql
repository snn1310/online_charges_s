create or replace function aws_oracle_ext.dbms_xmlquery$closecontext(ctxHdl numeric) returns void
language plpgsql
as $$
declare
	emtyStr constant varchar := '';
    ctxIdx text;
    ctxVal text;
begin
	ctxIdx := aws_oracle_ext.dbms_xmlquery$ctxIdx(ctxHdl);

	begin
	  ctxVal := aws_oracle_ext.get_extpack_variable(variable_name => ctxIdx, missing_ok => false);
	exception when sqlstate '42704' then
				if position(ctxIdx in sqlerrm) then
	            	ctxVal := emtyStr;
	            else
	            	raise exception using hint = sqlstate, message = sqlerrm;
	            end if;
	          when others then
	            raise exception using hint = sqlstate, message = sqlerrm;
	end;

    begin
	    if nullif(ctxVal, emtyStr) is not null then
	    	perform aws_oracle_ext.set_extpack_variable(variable_name => ctxIdx, variable_value => null::text);
	    else
	    	raise exception undefined_object;
	    end if;

	exception when undefined_object then
		raise exception 'Invalid context handle specified.' using hint = '29532';
	end;
end; $$
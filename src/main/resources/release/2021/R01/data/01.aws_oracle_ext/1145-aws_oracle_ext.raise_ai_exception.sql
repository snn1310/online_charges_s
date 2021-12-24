create or replace procedure aws_oracle_ext.raise_ai_exception
  ( in p_ai_code integer
  , in p_message text
  , in p_severity text default 'CRITICAL' )
language plpgsql
as
$body$ 
declare
  l_stack text;
  l_object text;
  l_line integer;
begin
 get diagnostics l_stack = pg_context;
 
  select line[1], line[2]
    into l_object, l_line
    from regexp_matches(l_stack,'PL/pgSQL function (.*?)line (.*?) ', 'g') as stack_lines(line)
   limit 1 offset 1;
  
  if l_object is null then
  select line[1], line[2]
    into l_object, l_line
    from regexp_matches( l_stack, 'SQL function (\S+) statement (\d+)', 'g') as stack_lines(line)
    limit 1;
  end if;
  raise exception 
    using message = format('%I at line %s, AI %s [%s]: %s', l_object, l_line, p_ai_code, p_severity, p_message);
end;
$body$;
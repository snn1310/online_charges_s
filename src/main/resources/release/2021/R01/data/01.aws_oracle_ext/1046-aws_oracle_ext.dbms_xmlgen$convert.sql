create or replace function aws_oracle_ext.dbms_xmlgen$convert(xmlData text, flag numeric default aws_oracle_ext.dbms_xmlgen$entity_encode()) returns text
language plpgsql
as $$
declare
	escChars text[5][2] := array[array['&quot;', '"'], array['&apos;', ''''], array['&lt;', '<'], array['&gt;', '>'], array['&amp;', '&']];
    i int;
    lvResult text;
begin
	if flag >= aws_oracle_ext.dbms_xmlgen$entity_decode() then
		begin
			lvResult := xmlData;
			for i in 1 .. 5 loop
				lvResult := replace(lvResult, escChars[i][1], escChars[i][2]);
			end loop;
   	    exception when others then
			lvResult := null;
		    raise;
		end;
	elsif flag = aws_oracle_ext.dbms_xmlgen$entity_encode() then
		lvResult := xmlserialize(content (xpath('.', xmlelement(name dummy, xmlData), array[array['xsi', 'http://www.w3.org/2001/XMLSchema-instance']]))[1] as text);
	else
		raise exception 'XML processing error. Nagative value [%] was readed', flag using hint = '22063';
	end if;
    return lvResult;
end; $$

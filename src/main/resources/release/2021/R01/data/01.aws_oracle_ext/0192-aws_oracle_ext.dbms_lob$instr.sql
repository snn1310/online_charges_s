create or replace function aws_oracle_ext.DBMS_LOB$INSTR(lob_loc CHARACTER VARYING, pattern CHARACTER VARYING, off_set INTEGER default 1, nth integer default 1) returns INTEGER as
$BODY$
declare matches integer;
        ind integer;
begin
  /*parameters validation*/
  if lob_loc is null or pattern is null or off_set is null or nth is null then 
    return null;
  elsif (off_set < 1) or (nth < 1) then 
    return null;
  end if;

  if (off_set = 1) and (nth = 1) then 
    return strpos(lob_loc, pattern);
   else 
     matches := 0;
     for i in off_set..length(lob_loc) loop
       if substring(lob_loc, i, length(pattern)) = pattern then 
         ind := i;
	 matches := matches + 1;
	 if matches = nth then 
	   return ind;
	 end if;
       end if;           
     end loop;
     return 0;
  end if;
end;
$BODY$
LANGUAGE plpgsql;

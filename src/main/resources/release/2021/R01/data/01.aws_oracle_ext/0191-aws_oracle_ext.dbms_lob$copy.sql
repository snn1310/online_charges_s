create or replace function aws_oracle_ext.DBMS_LOB$COPY(inout dest_lob CHARACTER VARYING, src_lob CHARACTER VARYING, amount INTEGER, dest_offset integer default 1, src_offset  integer default 1) as 
$BODY$
declare src_res CHARACTER VARYING;
        dest_before CHARACTER VARYING;
        dest_after CHARACTER VARYING;
BEGIN
  if dest_lob is null or src_lob is null or amount is null or dest_offset is null or src_offset is null then raise exception 'invalid input parameters';
  elsif src_offset < 1 or dest_offset < 1 then raise exception 'invalid input parameters';
  elsif amount < 1 then raise exception 'invalid input parameters';
  end if;

  src_res := substring(src_lob from src_offset for amount);
  dest_before := substring(dest_lob, 1, dest_offset - 1);
  dest_after := substring(dest_lob from length(src_res) + length(dest_before) + 1);
  dest_lob := dest_before || src_res || dest_after;
END;  
$BODY$
LANGUAGE plpgsql;


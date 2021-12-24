/*
  Increments the variable emulating the ROWCOUNT cursor attribute's behaviour in Oracle. 
  Must be called whenever an explicit cursor's fetch occured, if the migrated object's 
  code contains the ROWCOUNT cursor attribute.

  Parameters:
    rc       -- variable emulating the ROWCOUNT attribute for the explicit cursor
    is_found -- value of the emulated FOUND curcor attribute, should be always set 
                to FOUND when calling the function

  Returns:
    Conditionally increased value of the rc parameter
*/
create or replace function aws_oracle_ext.increment_rowcount
  ( inout rc bigint
  , in is_found boolean )
as
$$
begin
  rc := rc + case when is_found then 1 else 0 end;
end;
$$ language plpgsql;

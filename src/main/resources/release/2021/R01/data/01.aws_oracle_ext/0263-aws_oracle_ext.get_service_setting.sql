create or replace function aws_oracle_ext.get_service_setting
  ( in p_service aws_oracle_ext.service_settings.service%type
  , in p_setting aws_oracle_ext.service_settings.setting%type )
  returns aws_oracle_ext.service_settings.value%type
as
$$
  select value from aws_oracle_ext.service_settings where service = p_service and setting = p_setting;
$$ language sql;
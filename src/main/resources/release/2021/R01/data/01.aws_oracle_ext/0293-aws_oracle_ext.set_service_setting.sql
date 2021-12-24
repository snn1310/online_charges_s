create or replace function aws_oracle_ext.set_service_setting
  ( in p_service aws_oracle_ext.service_settings.service%type
  , in p_setting aws_oracle_ext.service_settings.setting%type
  , in p_value aws_oracle_ext.service_settings.value%type )
  returns void
as
$$
  WITH 
  upd AS (
       UPDATE aws_oracle_ext.service_settings
       SET    value = p_value
       WHERE  service_settings.service = p_service
         AND  service_settings.setting = p_setting
       RETURNING service_settings.service, service_settings.setting
  )
  INSERT INTO aws_oracle_ext.service_settings(service, setting, value)
  SELECT p_service, p_setting, p_value
  WHERE  ( p_service, p_setting ) NOT IN (SELECT service, setting FROM upd);
$$ language sql;   
CREATE OR REPLACE FUNCTION aws_oracle_ext.sdo_closest_points(ip_geom1 geometry, ip_geom2 geometry, ip_unit character varying, INOUT op_dist double precision, INOUT op_geoma geometry, INOUT op_geomb geometry)
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
DECLARE
BEGIN 
   op_geoma := ST_CLOSESTPOINT(ip_geom1, ip_geom2);
   op_geomb := ST_CLOSESTPOINT(ip_geom2, ip_geom1);
   op_dist  := ST_DISTANCE(op_geoma, op_geomb);
 
  if ip_unit is not null then 
  case 
    when ip_unit = 'KM' or ip_unit = 'KILOMETER' then op_dist := op_dist/1000;   
    when ip_unit = 'CM' or ip_unit = 'CENTIMETER' then op_dist := op_dist/0.01;
    when ip_unit = 'MM' or ip_unit = 'MILLIIMETER' then op_dist := op_dist/0.001;
    when ip_unit = 'MILE'                           then op_dist := op_dist/1609.344;
    when ip_unit = 'NAUT_MILE'                       then op_dist := op_dist/1852;
    when ip_unit = 'SURVEY_FOOT'                      then op_dist := op_dist/0.3048006096012;
    when ip_unit = 'FOOT'                            then op_dist := op_dist/0.3048;
    when ip_unit = 'INCH'                           then op_dist := op_dist/0.0254;
    when ip_unit = 'YARD'                          then op_dist := op_dist/0.9144;
    when ip_unit = 'CHAIN'                        then op_dist := op_dist/20.1168;
    when ip_unit = 'ROD'                           then op_dist := op_dist/5.0292;
    when ip_unit = 'ROD'                            then op_dist := op_dist/5.0292;
    when ip_unit = 'LINK'                            then op_dist := op_dist/0.201166194975966;
    when ip_unit = 'MOD_USFT'                         then op_dist := op_dist/0.304812252984506;
    when ip_unit = 'CL_FT'                             then op_dist := op_dist/0.3047972651151;
    when ip_unit = 'IND_FT'                           then op_dist := op_dist/0.304799517990042;
    when ip_unit = 'LINK_BEN'                        then op_dist := op_dist/0.201167824943759;
    when ip_unit = 'LINK_SRS'                       then op_dist := op_dist/0.201167651215526;
    when ip_unit = 'CHN_BEN'                       then op_dist := op_dist/20.1167824943759;
    when ip_unit = 'CHN_SRS'                      then op_dist := op_dist/20.1167651215526;
    when ip_unit = 'IND_YARD'                      then op_dist := op_dist/0.914398553970127;
    when ip_unit = 'SRS_YARD'                       then op_dist := op_dist/0.914398414616029;
    when ip_unit = 'FATHOM'                          then op_dist := op_dist/1.8288;
    when ip_unit = 'British foot (1936)'              then op_dist := op_dist/0.3048007491;
  end case;
 end if; 
END;
$function$;
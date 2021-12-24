CREATE OR REPLACE FUNCTION aws_oracle_ext.within_distance(IN  ip_geom1  geometry, IN  ip_dist  numeric, IN ip_geom2  geometry, IN ip_tol numeric, IN ip_units varchar)
 RETURNS varchar
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
DECLARE
    v_dist  FLOAT;
    v_res   VARCHAR := 'FALSE';
    BEGIN
      v_dist := st_distance(ip_geom1, ip_geom2);
      if abs(v_dist - ip_dist) < ip_tol 
        then v_res := 'TRUE'; 
      end if; 
 RETURN v_res;
END;
$function$;
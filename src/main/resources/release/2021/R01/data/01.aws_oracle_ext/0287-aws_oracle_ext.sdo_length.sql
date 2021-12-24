CREATE OR REPLACE FUNCTION aws_oracle_ext.sdo_length
(
    IN ip_geom  GEOMETRY
)
RETURNS DOUBLE PRECISION
AS
$function$

    SELECT
        CASE
            WHEN GeometryType(ip_geom) IN ('LINESTRING','MULTILINESTRING') THEN
                st_length(ip_geom)::DOUBLE PRECISION
            WHEN GeometryType(ip_geom) IN ('POLYGON','MULTIPOLYGON') THEN
                st_perimeter(ip_geom)::DOUBLE PRECISION
        END;

$function$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;
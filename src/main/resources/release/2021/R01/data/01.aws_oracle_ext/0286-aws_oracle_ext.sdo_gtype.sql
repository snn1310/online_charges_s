CREATE OR REPLACE FUNCTION aws_oracle_ext.sdo_gtype
(
    IN ip_geom1 geometry
)
RETURNS DOUBLE PRECISION
AS
$function$

    SELECT CONCAT
    (
        ST_CoordDim(ip_geom1)::VARCHAR,
        '00',
        CASE GeometryType(ip_geom1)
            WHEN 'POINT' THEN '1'
            WHEN 'LINESTRING' THEN '2'
            WHEN 'CIRCULARSTRING' THEN '2'
            WHEN 'COMPOUNDCURVE' THEN '2'
            WHEN 'POLYGON' THEN '3'
            WHEN 'GEOMETRYCOLLECTION' THEN '4'
            WHEN 'MULTIPOINT' THEN '5'
            WHEN 'MULTILINESTRING' THEN '6'
            WHEN 'MULTICURVE' THEN '6'
            WHEN 'MULTIPOLYGON' THEN '7'
            WHEN 'SOLID' THEN '8'
            WHEN 'MULTISOLID' THEN '9'
            ELSE '0'  
        END 
    )::DOUBLE PRECISION;

$function$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;
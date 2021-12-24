CREATE OR REPLACE FUNCTION aws_oracle_ext.collection_delete_make
                        (pcollection anyelement,
                         pm numeric,
                         pn numeric
                        )
 RETURNS anyarray
 LANGUAGE plpgsql
AS $function$
begin
    return pcollection[1: pm::numeric(10, 0) - 1] || pcollection[pn::numeric(10, 0) + 1:];
end;
$function$
;

CREATE OR REPLACE FUNCTION aws_oracle_ext.collection_trim_make
                            (pcollection anyelement,
                             pn numeric DEFAULT 1
                            )
 RETURNS anyarray
 LANGUAGE plpgsql
AS $function$
begin
    if cardinality(pcollection) >= pn::numeric(10, 0) then
       pcollection := pcollection[1: cardinality(pcollection) - pn::numeric(10, 0) ];
    else
        raise using message := 'SUBSCRIPT_BEYOND_COUNT',
                     detail := 'Subscript outside of limit',
                     hint := '-06532';
    end if;
    return pcollection;
end;
$function$
;
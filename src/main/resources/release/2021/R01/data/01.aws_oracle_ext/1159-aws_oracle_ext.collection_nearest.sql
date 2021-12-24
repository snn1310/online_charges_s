CREATE OR REPLACE FUNCTION aws_oracle_ext.collection_nearest
                                            (pcollection anyelement,
                                             pidx numeric,
                                             pfwrd boolean DEFAULT true
                                            )
 RETURNS numeric
 LANGUAGE plpgsql
AS $function$
begin
    return case
            when coalesce(pfwrd, true) then
                nullif((pidx::numeric(10,0) >= array_upper(pcollection, 1))::int, 1) +
                greatest(array_lower(pcollection, 1), pidx::numeric(10,0) + 1)
            else
                nullif((pidx::numeric(10,0) <= array_lower(pcollection, 1))::int, 1) +
                least(array_upper(pcollection, 1), pidx::numeric(10,0) - 1)
           end;
end; $function$
;

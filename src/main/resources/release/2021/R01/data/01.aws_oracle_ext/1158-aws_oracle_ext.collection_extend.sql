CREATE OR REPLACE FUNCTION aws_oracle_ext.collection_extend
                            (pcollection anyelement,
                             ppath numeric[] DEFAULT NULL::numeric[],
                             pcount numeric DEFAULT 1,
                             pidx numeric DEFAULT NULL::numeric
                            )
 RETURNS anyarray
 LANGUAGE plpgsql
AS $function$
begin
    if coalesce(cardinality(ppath), 0) > 0 then
        pcollection[ppath[1]::numeric(10, 0)] :=
                aws_oracle_ext.collection_extend
                        (pcollection => pcollection[ppath[1]::numeric(10, 0)],
                         ppath => ppath[2:]::numeric(10, 0)[],
                         pcount => pcount::numeric(10, 0),
                         pidx => pidx::numeric(10, 0)
                        );
    else
        for i in coalesce(array_length(pcollection, 1), 0) + 1 ..
                 coalesce(array_length(pcollection, 1), 0) +
                                       pcount::numeric(10, 0)
        loop
            pcollection[i] := pcollection[pidx::numeric(10, 0)];
        end loop;
    end if;
return pcollection;
end;
$function$
;

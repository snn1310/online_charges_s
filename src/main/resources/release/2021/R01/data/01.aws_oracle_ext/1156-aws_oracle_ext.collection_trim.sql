CREATE OR REPLACE FUNCTION aws_oracle_ext.collection_trim
                            (pcollection anyelement,
                             ppath numeric[] DEFAULT NULL::numeric[],
                             pn numeric DEFAULT 1
                            )
 RETURNS anyarray
 LANGUAGE plpgsql
AS $function$
begin
    if cardinality(ppath) > 1 then
      pcollection[ppath[1]::numeric(10, 0)] := aws_oracle_ext.collection_trim
                                (pcollection => pcollection[ppath[1]::numeric(10, 0)],
                                 ppath => ppath[2:]::numeric(10, 0)[]
                                );
    elsif ppath is not null then 
       pcollection[ppath[1]::numeric(10, 0)] := aws_oracle_ext.collection_trim_make
                                  (pcollection => pcollection[ppath[1]::numeric(10, 0)],
                                   pn => pn::numeric(10, 0)
                                  );
    else
       pcollection := aws_oracle_ext.collection_trim_make
                                  (pcollection => pcollection,
                                   pn => pn::numeric(10, 0)
                                  );
    end if;
    return pcollection;
end;
$function$
;

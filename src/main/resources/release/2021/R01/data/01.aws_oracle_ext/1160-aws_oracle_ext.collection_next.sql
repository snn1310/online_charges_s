do language plpgsql $collection_next$
<<collection_next>>
declare
begin
	CREATE OR REPLACE FUNCTION aws_oracle_ext.collection_next(pcollection anyelement, pn numeric)
     RETURNS numeric
     LANGUAGE plpgsql
    AS $function$
    begin
        return aws_oracle_ext.collection_nearest(pcollection => pcollection, pidx => pn);
    end; $function$
    ;

    CREATE OR REPLACE FUNCTION aws_oracle_ext.collection_next(pcollection anyelement, ppath numeric[], pn numeric)
     RETURNS numeric
     LANGUAGE plpgsql
    AS $function$
    begin
        if cardinality(ppath) > 1 then
            return aws_oracle_ext.collection_next
                                            (pcollection => pcollection[ppath[1]::numeric(10, 0)],
                                             ppath => ppath[2:]::numeric(10, 0)[],
                                             pn => pn
                                            );
        else
            return aws_oracle_ext.collection_nearest(pcollection => pcollection[ppath[1]::numeric(10, 0)], pidx => pn);
        end if;
    end; $function$
    ;
end; $collection_next$;
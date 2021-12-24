do language plpgsql $collection_delete$
<<collection_delete>>
begin
    CREATE OR REPLACE FUNCTION aws_oracle_ext.collection_delete(pcollection anyelement, pm numeric, pn numeric)
     RETURNS anyarray
     LANGUAGE plpgsql
    AS $function$
    begin
        return aws_oracle_ext.collection_delete
                                    (pcollection => pcollection,
                                     ppath => null::numeric(10, 0)[],
                                     pm => pm::numeric(10, 0),
                                     pn => pn::numeric(10, 0)
                                    );
    end;
    $function$
    ;

    CREATE OR REPLACE FUNCTION aws_oracle_ext.collection_delete(pcollection anyelement, ppath numeric[], pn numeric)
     RETURNS anyarray
     LANGUAGE plpgsql
    AS $function$
    begin
    
        if pn is null then
            return pcollection;
        end if;
    
        if cardinality(ppath) > 1 then
          pcollection[ppath[1]::numeric(10, 0)] := aws_oracle_ext.collection_delete
                                    (pcollection => pcollection[ppath[1]::numeric(10, 0)],
                                     ppath => ppath[2:]::numeric(10, 0)[],
                                     pn => pn::numeric(10, 0)
                                    );
        elsif ppath is not null then
           pcollection[ppath[1]::numeric(10, 0)] := aws_oracle_ext.collection_delete_make
                                      (pcollection => pcollection[ppath[1]::numeric(10, 0)],
                                       pm => pn::numeric(10, 0),
                                       pn => pn::numeric(10, 0)
                                      );
        else
           pcollection := aws_oracle_ext.collection_delete_make
                                      (pcollection => pcollection,
                                       pm => pn::numeric(10, 0),
                                       pn => pn::numeric(10, 0)
                                      );
        end if;
        return pcollection;
    end;
    $function$
    ;
    
    CREATE OR REPLACE FUNCTION aws_oracle_ext.collection_delete(pcollection anyelement, ppath numeric[] DEFAULT NULL::numeric[])
     RETURNS anyarray
     LANGUAGE plpgsql
    AS $function$
    begin
        if cardinality(ppath) > 1 then
          pcollection[ppath[1]::numeric(10, 0)] := aws_oracle_ext.collection_delete
                                            (pcollection[ppath[1]::numeric(10, 0)],
                                             ppath[2:]::numeric(10, 0)[]
                                            );
        elsif ppath is not null then
           pcollection := aws_oracle_ext.collection_delete_make
                                            (pcollection => pcollection,
                                             pm => ppath[1]::numeric(10, 0),
                                             pn => ppath[1]::numeric(10, 0)
                                            );
        else
           pcollection := null;
        end if;
        return pcollection;
    end;
    $function$
    ;
    
    CREATE OR REPLACE FUNCTION aws_oracle_ext.collection_delete(pcollection anyelement, ppath numeric[], pm numeric, pn numeric)
     RETURNS anyarray
     LANGUAGE plpgsql
    AS $function$
    begin
    
        if pm is null or pn is null or pm > pn then
            return pcollection;
        end if;
    
        if cardinality(ppath) > 1 then
          pcollection[ppath[1]::numeric(10, 0)] := aws_oracle_ext.collection_delete
                                    (pcollection => pcollection[ppath[1]::numeric(10, 0)],
                                     ppath => ppath[2:]::numeric(10, 0)[],
                                     pn => pn::numeric(10, 0),
                                     pm => pm::numeric(10, 0)
                                    );
        elsif ppath is not null then
           pcollection[ppath[1]::numeric(10, 0)] := aws_oracle_ext.collection_delete_make
                                      (pcollection => pcollection[ppath[1]::numeric(10, 0)],
                                       pm => pm::numeric(10, 0),
                                       pn => pn::numeric(10, 0)
                                      );
        else
           pcollection := aws_oracle_ext.collection_delete_make
                                      (pcollection => pcollection,
                                       pm => pm::numeric(10, 0),
                                       pn => pn::numeric(10, 0)
                                      );
        end if;
        return pcollection;
    end;
    $function$
    ;

	CREATE OR REPLACE FUNCTION aws_oracle_ext.collection_delete(pcollection anyelement, pn numeric)
     RETURNS anyarray
     LANGUAGE plpgsql
    AS $function$
    begin
        return aws_oracle_ext.collection_delete
                                    (pcollection => pcollection,
                                     ppath => null::numeric(10, 0)[],
                                     pn => pn::numeric(10, 0)
                                    );
    end;
$function$
;

end; $collection_delete$;

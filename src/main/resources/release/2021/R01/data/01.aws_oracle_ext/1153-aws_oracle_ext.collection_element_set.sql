DO
$BLOCK$
BEGIN

CREATE OR REPLACE FUNCTION aws_oracle_ext.collection_element_set
(
    pcollection IN ANYELEMENT,
    ppath IN NUMERIC[],
    pval IN RECORD
)
RETURNS ANYELEMENT
LANGUAGE plpgsql
AS
$BODY$
BEGIN 

    IF CARDINALITY(ppath) > 1 THEN

        pcollection[ppath[1]] := aws_oracle_ext.collection_element_set
        (
            pcollection[ppath[1]],
            ppath[2:],
            pval
        );

    ELSE

       IF COALESCE(CARDINALITY(pcollection), 0) = 0 THEN

            FOR i IN 1 .. ppath[1] - 1 LOOP

              pcollection[i] := NULL;

            END LOOP;

       END IF;

       pcollection[ppath[1]] := pval.f1;

    END IF;

    RETURN pcollection;

end;
$BODY$;

CREATE OR REPLACE FUNCTION aws_oracle_ext.collection_element_set
(
    pcollection IN ANYELEMENT,
    ppath IN NUMERIC[],
    pval IN NUMERIC
)
RETURNS ANYELEMENT
LANGUAGE plpgsql
AS
$BODY$
BEGIN 

    IF CARDINALITY(ppath) > 1 THEN

        pcollection[ppath[1]] := aws_oracle_ext.collection_element_set
        (
            pcollection[ppath[1]],
            ppath[2:],
            pval
        );

    ELSE

       IF COALESCE(CARDINALITY(pcollection), 0) = 0 THEN

            FOR i IN 1 .. ppath[1] - 1 LOOP

              pcollection[i] := NULL;

            END LOOP;

       END IF;

       pcollection[ppath[1]] := pval;

    END IF;

    RETURN pcollection;

end;
$BODY$;

CREATE OR REPLACE FUNCTION aws_oracle_ext.collection_element_set
(
    pcollection IN ANYELEMENT,
    ppath IN NUMERIC[],
    pval IN TEXT
)
RETURNS ANYELEMENT
LANGUAGE plpgsql
AS
$BODY$
BEGIN 

    IF CARDINALITY(ppath) > 1 THEN

        pcollection[ppath[1]] := aws_oracle_ext.collection_element_set
        (
            pcollection[ppath[1]],
            ppath[2:],
            pval
        );

    ELSE

       IF COALESCE(CARDINALITY(pcollection), 0) = 0 THEN

            FOR i IN 1 .. ppath[1] - 1 LOOP

              pcollection[i] := NULL;

            END LOOP;

       END IF;

       pcollection[ppath[1]] := pval;

    END IF;

    RETURN pcollection;

end;
$BODY$;

CREATE OR REPLACE FUNCTION aws_oracle_ext.collection_element_set
(
    pcollection IN ANYELEMENT,
    ppath IN NUMERIC[],
    pval IN TIMESTAMP
)
RETURNS ANYELEMENT
LANGUAGE plpgsql
AS
$BODY$
BEGIN 

    IF CARDINALITY(ppath) > 1 THEN

        pcollection[ppath[1]] := aws_oracle_ext.collection_element_set
        (
            pcollection[ppath[1]],
            ppath[2:],
            pval
        );

    ELSE

       IF COALESCE(CARDINALITY(pcollection), 0) = 0 THEN

            FOR i IN 1 .. ppath[1] - 1 LOOP

              pcollection[i] := NULL;

            END LOOP;

       END IF;

       pcollection[ppath[1]] := pval;

    END IF;

    RETURN pcollection;

end;
$BODY$;

END;
$BLOCK$;

CREATE TABLE ocprice.chained_rows(
    owner_name CHARACTER VARYING(30),
    table_name CHARACTER VARYING(30),
    cluster_name CHARACTER VARYING(30),
    partition_name CHARACTER VARYING(30),
    subpartition_name CHARACTER VARYING(30),
    head_rowid CHARACTER(255),
    analyze_timestamp TIMESTAMP(0) WITHOUT TIME ZONE
)
        WITH (
        OIDS=FALSE
        );


CREATE TABLE ocprice.dba_test_replication(
    row_num SMALLINT NOT NULL,
    insert_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL DEFAULT (CLOCK_TIMESTAMP() AT TIME ZONE COALESCE(CURRENT_SETTING('aws_oracle_ext.tz', TRUE), 'GMT'))::TIMESTAMP(0),
    insert_cluster CHARACTER(1) NOT NULL DEFAULT 'A',
    row_text CHARACTER VARYING(100),
    modified_by CHARACTER VARYING(12),
    mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.dba_test_replication
     IS 'Table for DBA testing GoldenGate';


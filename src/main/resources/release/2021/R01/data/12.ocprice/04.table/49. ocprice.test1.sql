CREATE TABLE ocprice.test1(
    row_id INTEGER NOT NULL,
    split_value NUMERIC NOT NULL,
    split_text CHARACTER VARYING(128) NOT NULL,
    split_date TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT aws_oracle_ext.systimestamp()
)
        WITH (
        OIDS=FALSE
        );


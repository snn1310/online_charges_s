CREATE TABLE ocprice.sub_seat_limit(
    ssl_sub_document CHARACTER VARYING(10) NOT NULL,
    ssl_eff_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    ssl_end_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    ssl_limit_amount INTEGER NOT NULL,
    ssl_company_code CHARACTER VARYING(4) NOT NULL,
    ssl_modified_by CHARACTER VARYING(12) NOT NULL,
    ssl_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocprice.sub_seat_limit.ssl_sub_document
     IS 'Subscription document number';
COMMENT ON COLUMN ocprice.sub_seat_limit.ssl_eff_timestamp
     IS 'Date when the limit becomes effective';
COMMENT ON COLUMN ocprice.sub_seat_limit.ssl_end_timestamp
     IS 'Date when the limit ends';
COMMENT ON COLUMN ocprice.sub_seat_limit.ssl_limit_amount
     IS 'Number of allowed seats';
COMMENT ON COLUMN ocprice.sub_seat_limit.ssl_company_code
     IS 'Company code';
COMMENT ON COLUMN ocprice.sub_seat_limit.ssl_modified_by
     IS 'Modified by identifier';
COMMENT ON COLUMN ocprice.sub_seat_limit.ssl_mod_timestamp
     IS 'Timestamp of insert or update';


CREATE TABLE ocdetail.billable_cap_accumulation(
    bo_id CHARACTER VARYING(33) NOT NULL,
    bca_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    bca_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    bca_client_expr CHARACTER VARYING(35) NOT NULL,
    bca_accum_amount NUMERIC(9,2) NOT NULL,
    bca_currency_code CHARACTER VARYING(5) NOT NULL,
    bca_cap_reached_timestamp TIMESTAMP(6) WITHOUT TIME ZONE,
    bca_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocdetail.billable_cap_accumulation.bo_id
     IS 'Generated id.';
COMMENT ON COLUMN ocdetail.billable_cap_accumulation.bca_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ocdetail.billable_cap_accumulation.bca_end_date
     IS 'End date.';
COMMENT ON COLUMN ocdetail.billable_cap_accumulation.bca_client_expr
     IS 'Client expiration.';
COMMENT ON COLUMN ocdetail.billable_cap_accumulation.bca_accum_amount
     IS 'Accumulation amount.';
COMMENT ON COLUMN ocdetail.billable_cap_accumulation.bca_currency_code
     IS 'Currency code.';
COMMENT ON COLUMN ocdetail.billable_cap_accumulation.bca_cap_reached_timestamp
     IS 'Cap reached timestamp.';
COMMENT ON COLUMN ocdetail.billable_cap_accumulation.bca_mod_timestamp
     IS 'Modified timestamp.';


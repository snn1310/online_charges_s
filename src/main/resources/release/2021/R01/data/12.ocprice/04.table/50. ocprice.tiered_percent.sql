CREATE TABLE ocprice.tiered_percent(
    tp_domain CHARACTER VARYING(15) NOT NULL,
    tp_tier_code CHARACTER VARYING(3) NOT NULL,
    tp_prc_serv_type CHARACTER VARYING(3) NOT NULL,
    tp_billing_method CHARACTER(1) NOT NULL,
    tp_database_name CHARACTER VARYING(18) NOT NULL,
    tp_usage_type CHARACTER VARYING(2) NOT NULL,
    tp_access_method CHARACTER VARYING(3) NOT NULL DEFAULT 'DFT',
    tp_sub_usg_type CHARACTER VARYING(18) NOT NULL,
    tp_high_count INTEGER NOT NULL,
    mpg_mat_prc_grp CHARACTER VARYING(2) NOT NULL,
    tp_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    tp_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    tp_percent NUMERIC(6,5) NOT NULL,
    tp_score SMALLINT,
    tp_company_code CHARACTER VARYING(4) NOT NULL,
    tp_modified_by CHARACTER VARYING(12) NOT NULL,
    tp_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.tiered_percent
     IS 'Tiered Percent Information';
COMMENT ON COLUMN ocprice.tiered_percent.tp_tier_code
     IS 'Tier code.';
COMMENT ON COLUMN ocprice.tiered_percent.tp_prc_serv_type
     IS 'Pricing service type (Defaultable).';
COMMENT ON COLUMN ocprice.tiered_percent.tp_billing_method
     IS 'Billing method.';
COMMENT ON COLUMN ocprice.tiered_percent.tp_database_name
     IS 'Database name (Defaultable).';
COMMENT ON COLUMN ocprice.tiered_percent.tp_usage_type
     IS 'Usage type.';
COMMENT ON COLUMN ocprice.tiered_percent.tp_access_method
     IS 'The access method that applies to this tiered percent.';
COMMENT ON COLUMN ocprice.tiered_percent.tp_sub_usg_type
     IS 'Sub usage type (Defaultable).';
COMMENT ON COLUMN ocprice.tiered_percent.tp_high_count
     IS 'High count for tier.';
COMMENT ON COLUMN ocprice.tiered_percent.mpg_mat_prc_grp
     IS 'Material price group.';
COMMENT ON COLUMN ocprice.tiered_percent.tp_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ocprice.tiered_percent.tp_end_date
     IS 'End date.';
COMMENT ON COLUMN ocprice.tiered_percent.tp_percent
     IS 'Percent.';
COMMENT ON COLUMN ocprice.tiered_percent.tp_score
     IS 'Rank the records for usage application.';
COMMENT ON COLUMN ocprice.tiered_percent.tp_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.tiered_percent.tp_mod_timestamp
     IS 'Modified timestamp.';


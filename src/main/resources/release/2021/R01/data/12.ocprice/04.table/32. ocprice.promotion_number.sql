CREATE TABLE ocprice.promotion_number(
    prn_promo_number CHARACTER VARYING(8) NOT NULL,
    prn_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    prn_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    prn_domain CHARACTER VARYING(15) NOT NULL,
    prn_promo_description CHARACTER VARYING(40) NOT NULL,
    prn_modified_by CHARACTER VARYING(12) NOT NULL,
    prn_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    prn_company_code CHARACTER VARYING(4) NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocprice.promotion_number.prn_promo_number
     IS 'Promotion number.';
COMMENT ON COLUMN ocprice.promotion_number.prn_eff_date
     IS 'Promotion number effective date.';
COMMENT ON COLUMN ocprice.promotion_number.prn_end_date
     IS 'Promotion number end date.';
COMMENT ON COLUMN ocprice.promotion_number.prn_domain
     IS 'Promotion number domain.';
COMMENT ON COLUMN ocprice.promotion_number.prn_promo_description
     IS 'Promotion number description.';
COMMENT ON COLUMN ocprice.promotion_number.prn_modified_by
     IS 'User or system performing modification.';
COMMENT ON COLUMN ocprice.promotion_number.prn_mod_timestamp
     IS 'Timestamp when last modified.';
COMMENT ON COLUMN ocprice.promotion_number.prn_company_code
     IS 'Company Code used to create or update.';


CREATE TABLE ocprice.promotion_security_group(
    prn_promo_number CHARACTER VARYING(8) NOT NULL,
    psg_security_group_id CHARACTER VARYING(15) NOT NULL,
    psg_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    psg_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    psg_domain CHARACTER VARYING(15) NOT NULL,
    psg_prod_classification CHARACTER VARYING(20),
    psg_prod_classification_desc CHARACTER VARYING(30),
    psg_modified_by CHARACTER VARYING(12) NOT NULL,
    psg_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    psg_company_code CHARACTER VARYING(4)
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocprice.promotion_security_group.prn_promo_number
     IS 'Promotion number.';
COMMENT ON COLUMN ocprice.promotion_security_group.psg_security_group_id
     IS 'Promotion group Prism ID';
COMMENT ON COLUMN ocprice.promotion_security_group.psg_eff_date
     IS 'Promotion group effective date.';
COMMENT ON COLUMN ocprice.promotion_security_group.psg_end_date
     IS 'Promotion group end date.';
COMMENT ON COLUMN ocprice.promotion_security_group.psg_domain
     IS 'Prism domain.';
COMMENT ON COLUMN ocprice.promotion_security_group.psg_prod_classification
     IS 'Product classification.';
COMMENT ON COLUMN ocprice.promotion_security_group.psg_prod_classification_desc
     IS 'Product classification description.';
COMMENT ON COLUMN ocprice.promotion_security_group.psg_modified_by
     IS 'User or system performing modification.';
COMMENT ON COLUMN ocprice.promotion_security_group.psg_mod_timestamp
     IS 'Timestamp when last modified.';
COMMENT ON COLUMN ocprice.promotion_security_group.psg_company_code
     IS 'Company Code used to create or update.';


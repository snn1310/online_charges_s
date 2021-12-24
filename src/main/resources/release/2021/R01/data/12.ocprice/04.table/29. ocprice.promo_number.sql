CREATE TABLE ocprice.promo_number(
    c_domain CHARACTER VARYING(15) NOT NULL,
    pn_promo_number CHARACTER VARYING(8) NOT NULL,
    c_content_id CHARACTER VARYING(33) NOT NULL,
    pn_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    pn_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    pn_promo_num_desc CHARACTER VARYING(40) NOT NULL,
    pn_company_code CHARACTER VARYING(4) NOT NULL,
    pn_modified_by CHARACTER VARYING(12) NOT NULL,
    pn_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.promo_number
     IS 'Promotion Number Information';
COMMENT ON COLUMN ocprice.promo_number.pn_promo_number
     IS 'Promotion number.';
COMMENT ON COLUMN ocprice.promo_number.c_content_id
     IS 'Generated ID for CONTENT.';
COMMENT ON COLUMN ocprice.promo_number.pn_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ocprice.promo_number.pn_end_date
     IS 'End date.';
COMMENT ON COLUMN ocprice.promo_number.pn_promo_num_desc
     IS 'Promortion number description.';
COMMENT ON COLUMN ocprice.promo_number.pn_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.promo_number.pn_mod_timestamp
     IS 'Modified timestamp.';


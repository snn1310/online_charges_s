CREATE TABLE ocprice.promotion(
    p_promo_num CHARACTER VARYING(8) NOT NULL,
    p_level_code CHARACTER VARYING(18) NOT NULL,
    p_level_value CHARACTER VARYING(33) NOT NULL,
    p_eff_date TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    p_end_date TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    p_domain CHARACTER VARYING(15) NOT NULL,
    p_promo_type CHARACTER VARYING(3) NOT NULL,
    p_cond_type CHARACTER VARYING(4) NOT NULL,
    p_disc_percent NUMERIC(5,4),
    p_limit_value NUMERIC(11,3),
    p_limit_curr_code CHARACTER VARYING(5),
    p_limit_total NUMERIC(8,3),
    p_limit_timestamp TIMESTAMP(6) WITHOUT TIME ZONE,
    p_cap_rank CHARACTER(1),
    p_company_code CHARACTER VARYING(4) NOT NULL,
    p_modified_by CHARACTER VARYING(12) NOT NULL,
    p_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    p_offer_id CHARACTER VARYING(33),
    p_alloc_document CHARACTER VARYING(10),
    p_alloc_item CHARACTER VARYING(6),
    p_data_owner CHARACTER VARYING(12) NOT NULL DEFAULT 'SAP',
    p_offer_channel CHARACTER VARYING(10)
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.promotion
     IS 'Promotion Information';
COMMENT ON COLUMN ocprice.promotion.p_promo_num
     IS 'Promotion number.';
COMMENT ON COLUMN ocprice.promotion.p_level_code
     IS 'Level code.';
COMMENT ON COLUMN ocprice.promotion.p_level_value
     IS 'Level value.';
COMMENT ON COLUMN ocprice.promotion.p_eff_date
     IS 'Effective timestamp.';
COMMENT ON COLUMN ocprice.promotion.p_end_date
     IS 'End timestamp.';
COMMENT ON COLUMN ocprice.promotion.p_promo_type
     IS 'Promotion type';
COMMENT ON COLUMN ocprice.promotion.p_cond_type
     IS 'Condition type.';
COMMENT ON COLUMN ocprice.promotion.p_disc_percent
     IS 'Discount percent.';
COMMENT ON COLUMN ocprice.promotion.p_limit_value
     IS 'Limit value.';
COMMENT ON COLUMN ocprice.promotion.p_limit_curr_code
     IS 'Limit currency code.';
COMMENT ON COLUMN ocprice.promotion.p_limit_total
     IS 'Limit running total.';
COMMENT ON COLUMN ocprice.promotion.p_limit_timestamp
     IS 'Limit exceeded timestamp.';
COMMENT ON COLUMN ocprice.promotion.p_cap_rank
     IS 'Capped rank.';
COMMENT ON COLUMN ocprice.promotion.p_company_code
     IS 'Company code.';
COMMENT ON COLUMN ocprice.promotion.p_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.promotion.p_mod_timestamp
     IS 'Modified timestamp.';
COMMENT ON COLUMN ocprice.promotion.p_offer_id
     IS 'The offer tracking id from the accepted promotion.';


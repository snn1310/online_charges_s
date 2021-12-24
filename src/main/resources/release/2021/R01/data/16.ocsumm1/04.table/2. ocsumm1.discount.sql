CREATE TABLE ocsumm1.discount(
    d_appl_order SMALLINT NOT NULL,
    u_id CHARACTER VARYING(33) NOT NULL,
    c_id CHARACTER VARYING(33) NOT NULL,
    d_domain CHARACTER VARYING(15) NOT NULL,
    d_company_id CHARACTER VARYING(4) NOT NULL,
    d_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    d_level_code CHARACTER VARYING(18) NOT NULL,
    d_promo_type CHARACTER VARYING(3) NOT NULL,
    d_cond_type CHARACTER VARYING(4) NOT NULL,
    d_promo_num CHARACTER VARYING(8),
    d_cap_rank CHARACTER(1),
    d_discount_usd NUMERIC(11,2) NOT NULL,
    d_discount_cur NUMERIC(11,2) NOT NULL,
    d_discount_pcnt NUMERIC(5,2) NOT NULL,
    d_offer_id CHARACTER VARYING(33),
    d_promo_applied CHARACTER(1),
    d_alloc_document CHARACTER VARYING(10),
    d_alloc_item CHARACTER VARYING(6),
    d_promo_code CHARACTER VARYING(35),
    d_offer_channel CHARACTER VARYING(10)
)
    PARTITION BY RANGE (d_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocsumm1.discount
     IS 'Discount';
COMMENT ON COLUMN ocsumm1.discount.d_appl_order
     IS 'Discount application order.';
COMMENT ON COLUMN ocsumm1.discount.u_id
     IS 'Generated id to link to usage table';
COMMENT ON COLUMN ocsumm1.discount.c_id
     IS 'Generated id to link to customer table.';
COMMENT ON COLUMN ocsumm1.discount.d_domain
     IS 'Domain';
COMMENT ON COLUMN ocsumm1.discount.d_company_id
     IS 'Company id';
COMMENT ON COLUMN ocsumm1.discount.d_date
     IS 'usage date.';
COMMENT ON COLUMN ocsumm1.discount.d_level_code
     IS 'level code';
COMMENT ON COLUMN ocsumm1.discount.d_promo_type
     IS 'promotion type';
COMMENT ON COLUMN ocsumm1.discount.d_cond_type
     IS 'condition type';
COMMENT ON COLUMN ocsumm1.discount.d_promo_num
     IS 'Promotion number.';
COMMENT ON COLUMN ocsumm1.discount.d_cap_rank
     IS 'Cap rank';
COMMENT ON COLUMN ocsumm1.discount.d_discount_usd
     IS 'Discount in USD';
COMMENT ON COLUMN ocsumm1.discount.d_discount_cur
     IS 'Discount in a foreign currency.';
COMMENT ON COLUMN ocsumm1.discount.d_discount_pcnt
     IS 'Discount percent.';
COMMENT ON COLUMN ocsumm1.discount.d_offer_id
     IS 'Promotion offer id.';
COMMENT ON COLUMN ocsumm1.discount.d_promo_applied
     IS ' Indicates via a Y or N if a promotion applies to pricing or not.';


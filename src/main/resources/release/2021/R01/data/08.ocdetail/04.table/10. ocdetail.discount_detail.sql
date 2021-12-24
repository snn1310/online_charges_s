CREATE TABLE ocdetail.discount_detail(
    dd_appl_order SMALLINT NOT NULL,
    bd_id CHARACTER VARYING(33) NOT NULL,
    dd_session_start_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    bd_usage_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    dd_level_code CHARACTER VARYING(18) NOT NULL,
    dd_promo_type CHARACTER VARYING(3) NOT NULL,
    dd_cond_type CHARACTER VARYING(4) NOT NULL,
    dd_promo_num CHARACTER VARYING(8),
    dd_cap_rank CHARACTER(1),
    dd_discount_usd NUMERIC(11,2) NOT NULL,
    dd_discount_cur NUMERIC(11,2) NOT NULL,
    dd_discount_pcnt NUMERIC(5,2) NOT NULL,
    dd_domain CHARACTER VARYING(15) NOT NULL,
    dd_company_id CHARACTER VARYING(4) NOT NULL,
    dd_offer_id CHARACTER VARYING(33),
    dd_alloc_document CHARACTER VARYING(10),
    dd_alloc_item CHARACTER VARYING(6),
    dd_promo_code CHARACTER VARYING(35),
    dd_offer_channel CHARACTER VARYING(10)
)
    PARTITION BY RANGE (dd_session_start_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocdetail.discount_detail
     IS 'Discount Detail';
COMMENT ON COLUMN ocdetail.discount_detail.dd_appl_order
     IS 'Application order.';
COMMENT ON COLUMN ocdetail.discount_detail.bd_id
     IS 'Generated id.';
COMMENT ON COLUMN ocdetail.discount_detail.dd_session_start_date
     IS 'Session start date, used for partitioning.';
COMMENT ON COLUMN ocdetail.discount_detail.bd_usage_date
     IS 'Usage date.';
COMMENT ON COLUMN ocdetail.discount_detail.dd_level_code
     IS 'Level code.';
COMMENT ON COLUMN ocdetail.discount_detail.dd_promo_type
     IS 'Promotion type.';
COMMENT ON COLUMN ocdetail.discount_detail.dd_cond_type
     IS 'Condition type.';
COMMENT ON COLUMN ocdetail.discount_detail.dd_promo_num
     IS 'Promotion number.';
COMMENT ON COLUMN ocdetail.discount_detail.dd_cap_rank
     IS 'Capped incentive rank.';
COMMENT ON COLUMN ocdetail.discount_detail.dd_discount_usd
     IS 'Non-capped discount amount applied to regular override charge in USD.';
COMMENT ON COLUMN ocdetail.discount_detail.dd_discount_cur
     IS 'Non-capped discount amount applied to regular override charge in customer currency.';
COMMENT ON COLUMN ocdetail.discount_detail.dd_discount_pcnt
     IS 'Discount percent.';
COMMENT ON COLUMN ocdetail.discount_detail.dd_domain
     IS 'Domain.';
COMMENT ON COLUMN ocdetail.discount_detail.dd_company_id
     IS 'Company code.';
COMMENT ON COLUMN ocdetail.discount_detail.dd_offer_id
     IS 'Promotion offer id.';


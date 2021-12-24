CREATE TABLE ccdetail1.billing_detail(
    bd_id CHARACTER VARYING(33) NOT NULL,
    cd_id CHARACTER VARYING(33) NOT NULL,
    bd_session_start_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    bd_usage_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    bd_domain CHARACTER VARYING(15) NOT NULL,
    bd_usage_type CHARACTER VARYING(2) NOT NULL,
    bd_prc_serv_type CHARACTER VARYING(3),
    bd_client_id_text CHARACTER VARYING(35) NOT NULL,
    bd_database_name CHARACTER VARYING(18) NOT NULL,
    bd_db_mat_num CHARACTER VARYING(18) NOT NULL,
    bd_db_vendor_code CHARACTER VARYING(3) NOT NULL,
    bd_db_general_ind CHARACTER(1) NOT NULL,
    bd_usage_quantity INTEGER NOT NULL,
    bd_charge_rule CHARACTER(1) NOT NULL,
    bd_cls_mat_num CHARACTER VARYING(18) NOT NULL,
    bd_product_code CHARACTER VARYING(14) NOT NULL,
    bd_currency_code CHARACTER VARYING(5) NOT NULL,
    bd_regov_chrg_usd NUMERIC(11,2) NOT NULL,
    bd_regov_chrg_cur NUMERIC(11,2) NOT NULL,
    bd_act_chrg_usd NUMERIC(11,2) NOT NULL,
    bd_act_chrg_cur NUMERIC(11,2) NOT NULL,
    bd_tier_code CHARACTER VARYING(3),
    bd_tier_percent NUMERIC(5,2),
    bd_incl_excl_ind CHARACTER(1) NOT NULL,
    bd_sub_mat_num CHARACTER VARYING(18) NOT NULL,
    bd_sub_document CHARACTER VARYING(10) NOT NULL,
    bd_line_item_num CHARACTER VARYING(6) NOT NULL,
    bd_grp_mat_num CHARACTER VARYING(18) NOT NULL,
    bd_grp_table_name CHARACTER VARYING(18),
    bd_sdef_ind CHARACTER(1) NOT NULL,
    bd_sdef_chrg_cur NUMERIC(11,2) NOT NULL,
    bd_comp_code CHARACTER(1) NOT NULL,
    bd_company_id CHARACTER VARYING(4) NOT NULL,
    bd_price_quantity INTEGER NOT NULL,
    bd_alloc_document CHARACTER VARYING(10) NOT NULL,
    bd_alloc_item CHARACTER VARYING(6) NOT NULL,
    bd_visible_code CHARACTER VARYING(3) NOT NULL DEFAULT 'SAU',
    bd_offer_id CHARACTER VARYING(33),
    bd_offer_channel CHARACTER VARYING(10),
    bd_capped_client_id CHARACTER VARYING(35),
    bd_orig_sdef_chrg_cur NUMERIC(11,2),
    bd_orig_sdef_ind CHARACTER(1)
)
    PARTITION BY RANGE (bd_session_start_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ccdetail1.billing_detail
     IS 'Billing Detail';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_id
     IS 'Generated id.';
COMMENT ON COLUMN ccdetail1.billing_detail.cd_id
     IS 'Generated id.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_session_start_date
     IS 'Session start date, used for partitioning.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_usage_date
     IS 'Usage date.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_domain
     IS 'Domain.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_usage_type
     IS 'Usage type.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_prc_serv_type
     IS 'Pricing service type.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_client_id_text
     IS 'Client id text.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_database_name
     IS 'Database name.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_db_mat_num
     IS 'Database material number.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_db_vendor_code
     IS 'Database vendor code.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_db_general_ind
     IS 'General database indicator.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_usage_quantity
     IS 'Usage quantity.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_charge_rule
     IS 'Charge rule.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_cls_mat_num
     IS 'Price class material number.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_product_code
     IS 'Product code.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_currency_code
     IS 'Customer currency code.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_regov_chrg_usd
     IS 'Regular/override charge in USD.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_regov_chrg_cur
     IS 'Regular/override charge in customer currency.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_act_chrg_usd
     IS 'Actual charge in USD.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_act_chrg_cur
     IS 'Actual charge in customer currency.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_tier_code
     IS 'Tier code.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_tier_percent
     IS 'Tier percent.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_incl_excl_ind
     IS 'Include exclude indicator.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_sub_mat_num
     IS 'Subscription material number.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_sub_document
     IS 'Subscription document.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_line_item_num
     IS 'Line item number.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_grp_mat_num
     IS 'Billing database group material number.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_grp_table_name
     IS 'Database group material number pricing derivation table name.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_sdef_ind
     IS 'Subscriber defined indicator.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_sdef_chrg_cur
     IS 'Subscriber defined charge in customer currency.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_comp_code
     IS 'Completion code.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_company_id
     IS 'Company code.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_price_quantity
     IS 'The quantity of priced units; used to multiply by rate to get the price.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_capped_client_id
     IS 'Capped client id.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_orig_sdef_chrg_cur
     IS 'Original subscriber defined charge in customer currency.';
COMMENT ON COLUMN ccdetail1.billing_detail.bd_orig_sdef_ind
     IS 'Original subscriber defined indicator.';


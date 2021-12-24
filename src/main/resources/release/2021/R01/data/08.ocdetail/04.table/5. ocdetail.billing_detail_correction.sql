CREATE TABLE ocdetail.billing_detail_correction(
    bdc_id CHARACTER VARYING(33) NOT NULL,
    cd_id CHARACTER VARYING(33) NOT NULL,
    bdc_session_start_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    bdc_usage_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    bdc_domain CHARACTER VARYING(15) NOT NULL,
    bdc_usage_type CHARACTER VARYING(2) NOT NULL,
    bdc_prc_serv_type CHARACTER VARYING(3),
    bdc_client_id_text CHARACTER VARYING(35) NOT NULL,
    bdc_database_name CHARACTER VARYING(18) NOT NULL,
    bdc_db_mat_num CHARACTER VARYING(18) NOT NULL,
    bdc_db_vendor_code CHARACTER VARYING(3) NOT NULL,
    bdc_db_general_ind CHARACTER(1) NOT NULL,
    bdc_usage_quantity INTEGER NOT NULL,
    bdc_charge_rule CHARACTER(1) NOT NULL,
    bdc_cls_mat_num CHARACTER VARYING(18) NOT NULL,
    bdc_product_code CHARACTER VARYING(14) NOT NULL,
    bdc_currency_code CHARACTER VARYING(5) NOT NULL,
    bdc_regov_chrg_usd NUMERIC(11,2) NOT NULL,
    bdc_regov_chrg_cur NUMERIC(11,2) NOT NULL,
    bdc_act_chrg_usd NUMERIC(11,2) NOT NULL,
    bdc_act_chrg_cur NUMERIC(11,2) NOT NULL,
    bdc_tier_code CHARACTER VARYING(3),
    bdc_tier_percent NUMERIC(5,2),
    bdc_incl_excl_ind CHARACTER(1) NOT NULL,
    bdc_sub_mat_num CHARACTER VARYING(18) NOT NULL,
    bdc_sub_document CHARACTER VARYING(10) NOT NULL,
    bdc_line_item_num CHARACTER VARYING(6) NOT NULL,
    bdc_grp_mat_num CHARACTER VARYING(18) NOT NULL,
    bdc_grp_table_name CHARACTER VARYING(18),
    bdc_sdef_ind CHARACTER(1) NOT NULL,
    bdc_sdef_chrg_cur NUMERIC(11,2) NOT NULL,
    bdc_comp_code CHARACTER(1) NOT NULL,
    bdc_company_id CHARACTER VARYING(4) NOT NULL,
    bdc_price_quantity INTEGER NOT NULL,
    bdc_alloc_document CHARACTER VARYING(10) NOT NULL,
    bdc_alloc_item CHARACTER VARYING(6) NOT NULL,
    bdc_visible_code CHARACTER VARYING(3) NOT NULL,
    bdc_offer_id CHARACTER VARYING(33),
    bdc_offer_channel CHARACTER VARYING(10),
    bdc_capped_client_id CHARACTER VARYING(35),
    bdc_orig_sdef_chrg_cur NUMERIC(11,2),
    bdc_orig_sdef_ind CHARACTER(1)
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocdetail.billing_detail_correction
     IS 'Billing Detail Corrections';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_id
     IS 'Generated id.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.cd_id
     IS 'Generated id.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_session_start_date
     IS 'Session start date, used for partitioning.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_usage_date
     IS 'Usage date.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_domain
     IS 'Domain.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_usage_type
     IS 'Usage type.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_prc_serv_type
     IS 'Pricing service type.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_client_id_text
     IS 'Client id text.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_database_name
     IS 'Database name.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_db_mat_num
     IS 'Database material number.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_db_vendor_code
     IS 'Database vendor code.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_db_general_ind
     IS 'General database indicator.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_usage_quantity
     IS 'Usage quantity.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_charge_rule
     IS 'Charge rule.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_cls_mat_num
     IS 'Price class material number.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_product_code
     IS 'Product code.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_currency_code
     IS 'Customer currency code.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_regov_chrg_usd
     IS 'Regular/override charge in USD.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_regov_chrg_cur
     IS 'Regular/override charge in customer currency.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_act_chrg_usd
     IS 'Actual charge in USD.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_act_chrg_cur
     IS 'Actual charge in customer currency.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_tier_code
     IS 'Tier code.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_tier_percent
     IS 'Tier percent.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_incl_excl_ind
     IS 'Include exclude indicator.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_sub_mat_num
     IS 'Subscription material number.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_sub_document
     IS 'Subscription document.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_line_item_num
     IS 'Line item number.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_grp_mat_num
     IS 'Billing database group material number.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_grp_table_name
     IS 'Database group material number pricing derivation table name.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_sdef_ind
     IS 'Subscriber defined indicator.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_sdef_chrg_cur
     IS 'Subscriber defined charge in customer currency.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_comp_code
     IS 'Completion code.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_company_id
     IS 'Company code.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_price_quantity
     IS 'The quantity of priced units; used to multiply by rate to get the price.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_visible_code
     IS 'A visiblity indicator derived from the trackable code, subscription, and configuration';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_offer_id
     IS 'Unica campaign number';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_offer_channel
     IS 'examples email, estore, blog link, in app..';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_capped_client_id
     IS 'Capped client id.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_orig_sdef_chrg_cur
     IS 'Original subscriber defined charge in customer currency.';
COMMENT ON COLUMN ocdetail.billing_detail_correction.bdc_orig_sdef_ind
     IS 'Original subscriber defined indicator.';


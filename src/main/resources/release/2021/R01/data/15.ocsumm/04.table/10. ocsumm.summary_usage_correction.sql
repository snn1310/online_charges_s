CREATE TABLE ocsumm.summary_usage_correction(
    suc_id CHARACTER VARYING(33) NOT NULL,
    c_id CHARACTER VARYING(33) NOT NULL,
    suc_domain CHARACTER VARYING(15) NOT NULL,
    suc_company_id CHARACTER VARYING(4) NOT NULL,
    suc_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    suc_software_type CHARACTER VARYING(2) NOT NULL,
    suc_software_ver CHARACTER VARYING(4) NOT NULL,
    suc_onl_serv_type CHARACTER VARYING(4) NOT NULL,
    suc_billing_option CHARACTER(1) NOT NULL,
    suc_platform_code CHARACTER VARYING(4),
    suc_usage_type CHARACTER VARYING(2) NOT NULL,
    suc_prc_serv_type CHARACTER VARYING(3),
    suc_client_id_text CHARACTER VARYING(35) NOT NULL,
    suc_database_name CHARACTER VARYING(18) NOT NULL,
    suc_db_mat_num CHARACTER VARYING(18) NOT NULL,
    suc_db_vendor_code CHARACTER VARYING(3) NOT NULL,
    suc_db_general_ind CHARACTER(1) NOT NULL,
    suc_usage_quantity BIGINT NOT NULL,
    suc_charge_rule CHARACTER(1) NOT NULL,
    suc_cls_mat_num CHARACTER VARYING(18) NOT NULL,
    suc_product_code CHARACTER VARYING(14) NOT NULL,
    suc_currency_code CHARACTER VARYING(5) NOT NULL,
    suc_regov_chrg_usd NUMERIC(11,2) NOT NULL,
    suc_regov_chrg_cur NUMERIC(11,2) NOT NULL,
    suc_act_chrg_usd NUMERIC(11,2) NOT NULL,
    suc_act_chrg_cur NUMERIC(11,2) NOT NULL,
    suc_tier_code_price CHARACTER VARYING(3),
    suc_tier_percent NUMERIC(5,2),
    suc_incl_excl_ind CHARACTER(1) NOT NULL,
    suc_sub_mat_num CHARACTER VARYING(18) NOT NULL,
    suc_sub_document CHARACTER VARYING(10) NOT NULL,
    suc_line_item CHARACTER VARYING(6) NOT NULL,
    suc_grp_mat_num CHARACTER VARYING(18) NOT NULL,
    suc_grp_table_name CHARACTER VARYING(18),
    suc_sdef_ind CHARACTER(1) NOT NULL,
    suc_sdef_chrg_cur NUMERIC(11,2) NOT NULL,
    suc_doc_cnt BIGINT NOT NULL,
    suc_line_cnt BIGINT NOT NULL,
    suc_page_cnt BIGINT NOT NULL,
    suc_results_ind CHARACTER(1),
    suc_meter_code CHARACTER(1) NOT NULL,
    suc_udm_ind CHARACTER(1),
    suc_comp_code CHARACTER(1),
    suc_access_method CHARACTER VARYING(3),
    suc_request_source CHARACTER VARYING(4),
    suc_request_ver CHARACTER VARYING(4),
    suc_trail_code CHARACTER(1),
    suc_format_code CHARACTER VARYING(3),
    suc_dest_code CHARACTER VARYING(3),
    suc_frequency_code CHARACTER VARYING(3),
    suc_search_type CHARACTER VARYING(3),
    suc_find_type CHARACTER VARYING(2),
    suc_unique_code CHARACTER(1),
    suc_repeat_code CHARACTER(1),
    suc_doc_origin CHARACTER VARYING(3),
    suc_doc_type CHARACTER VARYING(6),
    suc_price_code CHARACTER VARYING(4),
    suc_reprint_ind CHARACTER(1),
    suc_group_type CHARACTER VARYING(18),
    suc_group_id CHARACTER VARYING(33),
    suc_session_type CHARACTER(1),
    suc_confirm_num CHARACTER VARYING(9),
    suc_date_submitted TIMESTAMP(0) WITHOUT TIME ZONE,
    suc_part_cnt BIGINT NOT NULL,
    suc_tran_cnt BIGINT NOT NULL,
    suc_command_type CHARACTER VARYING(18),
    suc_tier_code_usage CHARACTER VARYING(3),
    suc_folder_code CHARACTER(1),
    suc_alloc_document CHARACTER VARYING(10) NOT NULL,
    suc_alloc_item CHARACTER VARYING(6) NOT NULL,
    suc_quote_item_id CHARACTER VARYING(33),
    suc_royalty_hash BIGINT NOT NULL,
    suc_discount_hash BIGINT NOT NULL,
    suc_inplan_hash BIGINT NOT NULL,
    suc_visible_code CHARACTER VARYING(3) NOT NULL DEFAULT 'SAU',
    suc_offer_id CHARACTER VARYING(33),
    suc_offer_channel CHARACTER VARYING(10),
    suc_billable_ind CHARACTER(1)
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocsumm.summary_usage_correction
     IS 'SUMMARY_USAGE_CORRECTION';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_id
     IS 'Generated id';
COMMENT ON COLUMN ocsumm.summary_usage_correction.c_id
     IS 'Generated id - link to customer table.';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_domain
     IS 'Domain';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_company_id
     IS 'Company id';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_date
     IS 'usage date';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_software_type
     IS 'Software type';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_software_ver
     IS 'Software version';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_onl_serv_type
     IS 'Online service type';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_billing_option
     IS 'Billing option';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_platform_code
     IS 'Platform code';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_usage_type
     IS 'SUMMARY_USAGE_CORRECTION type';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_prc_serv_type
     IS 'Price service type';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_client_id_text
     IS 'Client id text';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_database_name
     IS 'Database name';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_db_mat_num
     IS 'Database material number';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_db_vendor_code
     IS 'Database vendor code';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_db_general_ind
     IS 'Database general indicator';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_usage_quantity
     IS 'SUMMARY_USAGE_CORRECTION quantity.';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_charge_rule
     IS 'Charge rule: chargeable or free';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_cls_mat_num
     IS 'Class material number';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_product_code
     IS 'Product code';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_currency_code
     IS 'Currency code';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_regov_chrg_usd
     IS 'Regular override charge USD';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_regov_chrg_cur
     IS 'Regular override charge currency.';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_act_chrg_usd
     IS 'Actual charge USD';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_act_chrg_cur
     IS 'Acutal charge currency';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_tier_code_price
     IS 'Tier code';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_tier_percent
     IS 'Tier percent';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_incl_excl_ind
     IS 'Include exclude indicator';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_sub_mat_num
     IS 'Sub material number';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_sub_document
     IS 'Subscription document';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_line_item
     IS 'Line item';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_grp_mat_num
     IS 'Group material number';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_grp_table_name
     IS 'Group table name';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_sdef_ind
     IS 'Subscriber defined indicator';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_sdef_chrg_cur
     IS 'Subscriber defined charge currency.';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_doc_cnt
     IS 'Print reporting document count.';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_line_cnt
     IS 'Line count';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_page_cnt
     IS 'Page count';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_results_ind
     IS 'Results indicator';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_meter_code
     IS 'Meter code';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_udm_ind
     IS 'User defined multibase indicator';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_comp_code
     IS 'Completion code';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_access_method
     IS 'Access method';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_request_source
     IS 'Request source';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_request_ver
     IS 'Request version';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_trail_code
     IS 'Trail code';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_format_code
     IS 'Format code';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_dest_code
     IS 'Destination code';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_frequency_code
     IS 'Frequency code';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_search_type
     IS 'Search type';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_find_type
     IS 'Find type';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_unique_code
     IS 'Unique code';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_repeat_code
     IS 'Repeat code';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_doc_origin
     IS 'Document origin';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_doc_type
     IS 'Document type';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_price_code
     IS 'Price code';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_reprint_ind
     IS 'The indicator for print resubmissions.';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_group_type
     IS 'The document grouping type.';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_group_id
     IS 'The document grouping identifier.';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_session_type
     IS 'Session type.';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_confirm_num
     IS 'Search confirmation number.';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_date_submitted
     IS 'Date search was submitted.';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_part_cnt
     IS 'The summarized number of document parts logged on the SUMMARY_USAGE_CORRECTION event.';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_tran_cnt
     IS 'The summarized transaction count logged on the SUMMARY_USAGE_CORRECTION event.';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_offer_id
     IS 'Unica campaign number';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_offer_channel
     IS 'examples email, estore, blog link, in app..';
COMMENT ON COLUMN ocsumm.summary_usage_correction.suc_billable_ind
     IS 'Billable Indicator.';


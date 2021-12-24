CREATE TABLE ocsumm1.usage(
    u_id CHARACTER VARYING(33) NOT NULL,
    c_id CHARACTER VARYING(33) NOT NULL,
    u_domain CHARACTER VARYING(15) NOT NULL,
    u_company_id CHARACTER VARYING(4) NOT NULL,
    u_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    u_software_type CHARACTER VARYING(2) NOT NULL,
    u_software_ver CHARACTER VARYING(4) NOT NULL,
    u_onl_serv_type CHARACTER VARYING(4) NOT NULL,
    u_billing_option CHARACTER(1) NOT NULL,
    u_platform_code CHARACTER VARYING(4),
    u_usage_type CHARACTER VARYING(2) NOT NULL,
    u_prc_serv_type CHARACTER VARYING(3),
    u_client_id_text CHARACTER VARYING(35) NOT NULL,
    u_database_name CHARACTER VARYING(18) NOT NULL,
    u_db_mat_num CHARACTER VARYING(18) NOT NULL,
    u_db_vendor_code CHARACTER VARYING(3) NOT NULL,
    u_db_general_ind CHARACTER(1) NOT NULL,
    u_usage_quantity BIGINT NOT NULL,
    u_charge_rule CHARACTER(1) NOT NULL,
    u_cls_mat_num CHARACTER VARYING(18) NOT NULL,
    u_product_code CHARACTER VARYING(14) NOT NULL,
    u_currency_code CHARACTER VARYING(5) NOT NULL,
    u_regov_chrg_usd NUMERIC(11,2) NOT NULL,
    u_regov_chrg_cur NUMERIC(11,2) NOT NULL,
    u_act_chrg_usd NUMERIC(11,2) NOT NULL,
    u_act_chrg_cur NUMERIC(11,2) NOT NULL,
    u_tier_code_price CHARACTER VARYING(3),
    u_tier_percent NUMERIC(5,2),
    u_incl_excl_ind CHARACTER(1) NOT NULL,
    u_sub_mat_num CHARACTER VARYING(18) NOT NULL,
    u_sub_document CHARACTER VARYING(10) NOT NULL,
    u_line_item CHARACTER VARYING(6) NOT NULL,
    u_grp_mat_num CHARACTER VARYING(18) NOT NULL,
    u_grp_table_name CHARACTER VARYING(18),
    u_sdef_ind CHARACTER(1) NOT NULL,
    u_sdef_chrg_cur NUMERIC(11,2) NOT NULL,
    u_doc_cnt BIGINT NOT NULL,
    u_line_cnt BIGINT NOT NULL,
    u_page_cnt BIGINT NOT NULL,
    u_results_ind CHARACTER(1),
    u_meter_code CHARACTER(1) NOT NULL,
    u_udm_ind CHARACTER(1),
    u_comp_code CHARACTER(1),
    u_access_method CHARACTER VARYING(3),
    u_request_source CHARACTER VARYING(4),
    u_request_ver CHARACTER VARYING(4),
    u_trail_code CHARACTER(1),
    u_format_code CHARACTER VARYING(3),
    u_dest_code CHARACTER VARYING(3),
    u_frequency_code CHARACTER VARYING(3),
    u_search_type CHARACTER VARYING(3),
    u_find_type CHARACTER VARYING(2),
    u_unique_code CHARACTER(1),
    u_repeat_code CHARACTER(1),
    u_doc_origin CHARACTER VARYING(3),
    u_doc_type CHARACTER VARYING(6),
    u_price_code CHARACTER VARYING(4),
    u_reprint_ind CHARACTER(1),
    u_group_type CHARACTER VARYING(18),
    u_group_id CHARACTER VARYING(33),
    u_session_type CHARACTER(1),
    u_confirm_num CHARACTER VARYING(9),
    u_date_submitted TIMESTAMP(0) WITHOUT TIME ZONE,
    u_part_cnt BIGINT NOT NULL,
    u_tran_cnt BIGINT NOT NULL,
    u_command_type CHARACTER VARYING(18),
    u_tier_code_usage CHARACTER VARYING(3),
    u_folder_code CHARACTER(1),
    u_alloc_document CHARACTER VARYING(10) NOT NULL,
    u_alloc_item CHARACTER VARYING(6) NOT NULL,
    u_quote_item_id CHARACTER VARYING(33),
    u_royalty_hash BIGINT NOT NULL,
    u_discount_hash BIGINT NOT NULL,
    u_inplan_hash BIGINT NOT NULL,
    u_visible_code CHARACTER VARYING(3) NOT NULL DEFAULT 'SAU',
    u_offer_id CHARACTER VARYING(33),
    u_offer_channel CHARACTER VARYING(10),
    u_billable_ind CHARACTER(1)
)
    PARTITION BY RANGE (u_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocsumm1.usage
     IS 'Usage';
COMMENT ON COLUMN ocsumm1.usage.u_id
     IS 'Generated id';
COMMENT ON COLUMN ocsumm1.usage.c_id
     IS 'Generated id - link to customer table.';
COMMENT ON COLUMN ocsumm1.usage.u_domain
     IS 'Domain';
COMMENT ON COLUMN ocsumm1.usage.u_company_id
     IS 'Company id';
COMMENT ON COLUMN ocsumm1.usage.u_date
     IS 'Usage date';
COMMENT ON COLUMN ocsumm1.usage.u_software_type
     IS 'Software type';
COMMENT ON COLUMN ocsumm1.usage.u_software_ver
     IS 'Software version';
COMMENT ON COLUMN ocsumm1.usage.u_onl_serv_type
     IS 'Online service type';
COMMENT ON COLUMN ocsumm1.usage.u_billing_option
     IS 'Billing option';
COMMENT ON COLUMN ocsumm1.usage.u_platform_code
     IS 'Platform code';
COMMENT ON COLUMN ocsumm1.usage.u_usage_type
     IS 'Usage type';
COMMENT ON COLUMN ocsumm1.usage.u_prc_serv_type
     IS 'Price service type';
COMMENT ON COLUMN ocsumm1.usage.u_client_id_text
     IS 'Client id text';
COMMENT ON COLUMN ocsumm1.usage.u_database_name
     IS 'Database name';
COMMENT ON COLUMN ocsumm1.usage.u_db_mat_num
     IS 'Database material number';
COMMENT ON COLUMN ocsumm1.usage.u_db_vendor_code
     IS 'Database vendor code';
COMMENT ON COLUMN ocsumm1.usage.u_db_general_ind
     IS 'Database general indicator';
COMMENT ON COLUMN ocsumm1.usage.u_usage_quantity
     IS 'Usage quantity.';
COMMENT ON COLUMN ocsumm1.usage.u_charge_rule
     IS 'Charge rule: chargeable or free';
COMMENT ON COLUMN ocsumm1.usage.u_cls_mat_num
     IS 'Class material number';
COMMENT ON COLUMN ocsumm1.usage.u_product_code
     IS 'Product code';
COMMENT ON COLUMN ocsumm1.usage.u_currency_code
     IS 'Currency code';
COMMENT ON COLUMN ocsumm1.usage.u_regov_chrg_usd
     IS 'Regular override charge USD';
COMMENT ON COLUMN ocsumm1.usage.u_regov_chrg_cur
     IS 'Regular override charge currency.';
COMMENT ON COLUMN ocsumm1.usage.u_act_chrg_usd
     IS 'Actual charge USD';
COMMENT ON COLUMN ocsumm1.usage.u_act_chrg_cur
     IS 'Acutal charge currency';
COMMENT ON COLUMN ocsumm1.usage.u_tier_code_price
     IS 'Tier code';
COMMENT ON COLUMN ocsumm1.usage.u_tier_percent
     IS 'Tier percent';
COMMENT ON COLUMN ocsumm1.usage.u_incl_excl_ind
     IS 'Include exclude indicator';
COMMENT ON COLUMN ocsumm1.usage.u_sub_mat_num
     IS 'Sub material number';
COMMENT ON COLUMN ocsumm1.usage.u_sub_document
     IS 'Subscription document';
COMMENT ON COLUMN ocsumm1.usage.u_line_item
     IS 'Line item';
COMMENT ON COLUMN ocsumm1.usage.u_grp_mat_num
     IS 'Group material number';
COMMENT ON COLUMN ocsumm1.usage.u_grp_table_name
     IS 'Group table name';
COMMENT ON COLUMN ocsumm1.usage.u_sdef_ind
     IS 'Subscriber defined indicator';
COMMENT ON COLUMN ocsumm1.usage.u_sdef_chrg_cur
     IS 'Subscriber defined charge currency.';
COMMENT ON COLUMN ocsumm1.usage.u_doc_cnt
     IS 'Print reporting document count.';
COMMENT ON COLUMN ocsumm1.usage.u_line_cnt
     IS 'Line count';
COMMENT ON COLUMN ocsumm1.usage.u_page_cnt
     IS 'Page count';
COMMENT ON COLUMN ocsumm1.usage.u_results_ind
     IS 'Results indicator';
COMMENT ON COLUMN ocsumm1.usage.u_meter_code
     IS 'Meter code';
COMMENT ON COLUMN ocsumm1.usage.u_udm_ind
     IS 'User defined multibase indicator';
COMMENT ON COLUMN ocsumm1.usage.u_comp_code
     IS 'Completion code';
COMMENT ON COLUMN ocsumm1.usage.u_access_method
     IS 'Access method';
COMMENT ON COLUMN ocsumm1.usage.u_request_source
     IS 'Request source';
COMMENT ON COLUMN ocsumm1.usage.u_request_ver
     IS 'Request version';
COMMENT ON COLUMN ocsumm1.usage.u_trail_code
     IS 'Trail code';
COMMENT ON COLUMN ocsumm1.usage.u_format_code
     IS 'Format code';
COMMENT ON COLUMN ocsumm1.usage.u_dest_code
     IS 'Destination code';
COMMENT ON COLUMN ocsumm1.usage.u_frequency_code
     IS 'Frequency code';
COMMENT ON COLUMN ocsumm1.usage.u_search_type
     IS 'Search type';
COMMENT ON COLUMN ocsumm1.usage.u_find_type
     IS 'Find type';
COMMENT ON COLUMN ocsumm1.usage.u_unique_code
     IS 'Unique code';
COMMENT ON COLUMN ocsumm1.usage.u_repeat_code
     IS 'Repeat code';
COMMENT ON COLUMN ocsumm1.usage.u_doc_origin
     IS 'Document origin';
COMMENT ON COLUMN ocsumm1.usage.u_doc_type
     IS 'Document type';
COMMENT ON COLUMN ocsumm1.usage.u_price_code
     IS 'Price code';
COMMENT ON COLUMN ocsumm1.usage.u_reprint_ind
     IS 'The indicator for print resubmissions.';
COMMENT ON COLUMN ocsumm1.usage.u_group_type
     IS 'The document grouping type.';
COMMENT ON COLUMN ocsumm1.usage.u_group_id
     IS 'The document grouping identifier.';
COMMENT ON COLUMN ocsumm1.usage.u_session_type
     IS 'Session type.';
COMMENT ON COLUMN ocsumm1.usage.u_confirm_num
     IS 'Search confirmation number.';
COMMENT ON COLUMN ocsumm1.usage.u_date_submitted
     IS 'Date search was submitted.';
COMMENT ON COLUMN ocsumm1.usage.u_part_cnt
     IS 'The summarized number of document parts logged on the usage event.';
COMMENT ON COLUMN ocsumm1.usage.u_tran_cnt
     IS 'The summarized transaction count logged on the usage event.';
COMMENT ON COLUMN ocsumm1.usage.u_billable_ind
     IS 'Billable Indicator.';


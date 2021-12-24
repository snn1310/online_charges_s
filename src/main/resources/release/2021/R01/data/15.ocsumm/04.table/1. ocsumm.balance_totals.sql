CREATE TABLE ocsumm.balance_totals(
    bt_charge_rule CHARACTER(1) NOT NULL,
    bt_company_id CHARACTER VARYING(4) NOT NULL,
    bt_domain CHARACTER VARYING(15) NOT NULL,
    bt_incl_excl_ind CHARACTER(1) NOT NULL,
    bt_sdef_ind CHARACTER(1) NOT NULL,
    bt_usage_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    bt_usage_type CHARACTER VARYING(2) NOT NULL,
    bt_data_owner CHARACTER VARYING(12) NOT NULL,
    bt_visible_code CHARACTER(3) NOT NULL,
    bt_act_chrg_usd NUMERIC(15,2) NOT NULL,
    bt_act_chrg_cur NUMERIC(15,2) NOT NULL,
    bt_doc_cnt BIGINT NOT NULL,
    bt_line_cnt BIGINT NOT NULL,
    bt_page_cnt BIGINT NOT NULL,
    bt_record_cnt BIGINT NOT NULL,
    bt_regov_chrg_usd NUMERIC(15,2) NOT NULL,
    bt_regov_chrg_cur NUMERIC(15,2) NOT NULL,
    bt_sdef_chrg_cur NUMERIC(15,2) NOT NULL,
    bt_usage_cnt BIGINT NOT NULL,
    bt_modified_by CHARACTER VARYING(12) NOT NULL,
    bt_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocsumm.balance_totals.bt_charge_rule
     IS 'Charge rule';
COMMENT ON COLUMN ocsumm.balance_totals.bt_company_id
     IS 'Company code';
COMMENT ON COLUMN ocsumm.balance_totals.bt_domain
     IS 'Customer domain';
COMMENT ON COLUMN ocsumm.balance_totals.bt_incl_excl_ind
     IS 'Include Exclude indicator';
COMMENT ON COLUMN ocsumm.balance_totals.bt_sdef_ind
     IS 'Subscriber defined indicator';
COMMENT ON COLUMN ocsumm.balance_totals.bt_usage_date
     IS 'Usage Date';
COMMENT ON COLUMN ocsumm.balance_totals.bt_usage_type
     IS 'Usage Type';
COMMENT ON COLUMN ocsumm.balance_totals.bt_data_owner
     IS 'User id data owner';
COMMENT ON COLUMN ocsumm.balance_totals.bt_visible_code
     IS 'Visible Code';
COMMENT ON COLUMN ocsumm.balance_totals.bt_act_chrg_usd
     IS 'Actual charge in USD';
COMMENT ON COLUMN ocsumm.balance_totals.bt_act_chrg_cur
     IS 'Actual charge in local currency';
COMMENT ON COLUMN ocsumm.balance_totals.bt_doc_cnt
     IS 'Print document count';
COMMENT ON COLUMN ocsumm.balance_totals.bt_line_cnt
     IS 'Print line count';
COMMENT ON COLUMN ocsumm.balance_totals.bt_page_cnt
     IS 'Print page count';
COMMENT ON COLUMN ocsumm.balance_totals.bt_record_cnt
     IS 'Row count';
COMMENT ON COLUMN ocsumm.balance_totals.bt_regov_chrg_usd
     IS 'Regular override charge in USD';
COMMENT ON COLUMN ocsumm.balance_totals.bt_regov_chrg_cur
     IS 'Regular override charge in local currency';
COMMENT ON COLUMN ocsumm.balance_totals.bt_sdef_chrg_cur
     IS 'Subscriber defined charge in local currency';
COMMENT ON COLUMN ocsumm.balance_totals.bt_usage_cnt
     IS 'Usage quantity count';
COMMENT ON COLUMN ocsumm.balance_totals.bt_modified_by
     IS 'Modified by';
COMMENT ON COLUMN ocsumm.balance_totals.bt_mod_timestamp
     IS 'Modified timestamp';


ALTER TABLE ocsumm.balance_totals
ADD CONSTRAINT xpkbalance_totals PRIMARY KEY (bt_charge_rule, bt_company_id, bt_domain, bt_incl_excl_ind, bt_sdef_ind, bt_usage_date, bt_usage_type, bt_data_owner, bt_visible_code);


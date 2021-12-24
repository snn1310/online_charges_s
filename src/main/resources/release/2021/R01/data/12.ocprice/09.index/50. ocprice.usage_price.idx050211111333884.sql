CREATE INDEX idx050211111333884
ON ocprice.usage_price
USING BTREE (up_usage_type ASC, pri_price_id ASC, up_billing_method ASC, up_prc_serv_type ASC, pri_domain ASC, up_eff_date ASC, up_end_date ASC, up_sub_usg_type ASC, up_database_name ASC, up_score ASC, up_company_code ASC, up_cls_mat_num ASC, up_charge_rule ASC, up_modified_by ASC, up_mod_timestamp ASC);


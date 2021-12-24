ALTER TABLE ocprice.tiered_percent
ADD CONSTRAINT xpktiered_percent PRIMARY KEY (tp_domain, tp_tier_code, tp_prc_serv_type, tp_billing_method, tp_database_name, tp_usage_type, tp_access_method, tp_sub_usg_type, tp_high_count, mpg_mat_prc_grp, tp_eff_date);


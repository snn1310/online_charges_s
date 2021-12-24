ALTER TABLE ocprice.usage_price
ADD CONSTRAINT xpkusage_price PRIMARY KEY (pri_domain, up_prc_serv_type, up_billing_method, up_database_name, up_usage_type, up_access_method, up_sub_usg_type, pri_price_id, up_eff_date);


ALTER TABLE ocprice.document_percent
ADD CONSTRAINT xpkdocument_percen PRIMARY KEY (pri_domain, dpt_prc_serv_type, dpt_billing_method, dpt_database_name, dpt_usage_type, dpt_sub_usg_type, pri_price_id, dpt_eff_date);


ALTER TABLE ocprice.document_price
ADD CONSTRAINT xpkdocument_price PRIMARY KEY (pri_domain, dp_prc_serv_type, dp_billing_method, dp_database_name, dp_doc_id, dp_usage_type, dp_sub_usg_type, pri_price_id, dp_eff_date);


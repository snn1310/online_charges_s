CREATE INDEX xie1document_perc
ON ocprice.document_percent
USING BTREE (dpt_database_name ASC, pri_price_id ASC, dpt_usage_type ASC, dpt_billing_method ASC, dpt_end_date ASC, dpt_eff_date ASC, dpt_mod_timestamp ASC, dpt_modified_by ASC, dpt_percent ASC, dpt_sub_usg_type ASC, dpt_prc_serv_type ASC);


CREATE INDEX OCSUMMDOCUMENT_CATEGORY_SUMMARY_dms_idx ON ONLY ocsumm.document_category_summary USING btree (dcs_doc_id COLLATE "C");

CREATE INDEX OCPRICEUSAGE_PRICE_dms_idx ON ONLY OCPRICE.USAGE_PRICE USING btree (pri_domain, up_prc_serv_type, up_billing_method, up_database_name, up_usage_type, up_access_method, up_sub_usg_type, pri_price_id COLLATE "C");

CREATE INDEX OCPRICEsubscription_dms_idx ON ONLY ocprice.subscription USING btree (s_sub_document COLLATE "C");

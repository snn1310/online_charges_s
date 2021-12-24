ALTER TABLE ocprice.onl_service_price
ADD CONSTRAINT xpkonl_service_price PRIMARY KEY (osp_domain, osp_onl_serv_type, osp_billing_method, osp_database_name, osp_usage_type, osp_access_method, osp_sub_usg_type, osp_eff_date);


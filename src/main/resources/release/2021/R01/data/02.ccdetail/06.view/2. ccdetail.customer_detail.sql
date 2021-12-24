CREATE OR REPLACE  VIEW ccdetail.customer_detail (cd_id, cd_session_start_date, cd_user_id, cd_usage_date, cd_company_id, cd_contact_num, cd_bill_grp, cd_pay_grp, cd_org_partner, cd_mat_price_grp, cd_juris_code, cd_tax_class, cd_country_code, cd_vat_reg_num, cd_domain, cd_industry_code, cd_group_code, cd_user_id_data_owner, cd_city, cd_state, cd_postal_code) AS
SELECT
    cd_id, cd_session_start_date, cd_user_id, cd_usage_date, cd_company_id, cd_contact_num, cd_bill_grp, cd_pay_grp, cd_org_partner, cd_mat_price_grp, cd_juris_code, cd_tax_class, cd_country_code, cd_vat_reg_num, cd_domain, cd_industry_code, cd_group_code, cd_user_id_data_owner, cd_city, cd_state, cd_postal_code
    FROM ccdetail1.customer_detail
UNION ALL
SELECT
    cd_id, cd_session_start_date, cd_user_id, cd_usage_date, cd_company_id, cd_contact_num, cd_bill_grp, cd_pay_grp, cd_org_partner, cd_mat_price_grp, cd_juris_code, cd_tax_class, cd_country_code, cd_vat_reg_num, cd_domain, cd_industry_code, cd_group_code, cd_user_id_data_owner, cd_city, cd_state, cd_postal_code
    FROM ccdetail2.customer_detail
UNION ALL
SELECT
    cd_id, cd_session_start_date, cd_user_id, cd_usage_date, cd_company_id, cd_contact_num, cd_bill_grp, cd_pay_grp, cd_org_partner, cd_mat_price_grp, cd_juris_code, cd_tax_class, cd_country_code, cd_vat_reg_num, cd_domain, cd_industry_code, cd_group_code, cd_user_id_data_owner, cd_city, cd_state, cd_postal_code
    FROM ccdetail3.customer_detail
UNION ALL
SELECT
    cd_id, cd_session_start_date, cd_user_id, cd_usage_date, cd_company_id, cd_contact_num, cd_bill_grp, cd_pay_grp, cd_org_partner, cd_mat_price_grp, cd_juris_code, cd_tax_class, cd_country_code, cd_vat_reg_num, cd_domain, cd_industry_code, cd_group_code, cd_user_id_data_owner, cd_city, cd_state, cd_postal_code
    FROM ccdetail4.customer_detail;


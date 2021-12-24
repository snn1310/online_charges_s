CREATE OR REPLACE  VIEW ocsumm.customer (c_id, c_company_id, c_date, c_user_id, c_contact_num, c_bill_grp, c_pay_grp, c_org_partner, c_mat_price_grp, c_juris_code, c_tax_class, c_country_code, c_vat_reg_num, c_user_id_data_owner, c_city, c_state, c_postal_code) AS
SELECT
    c_id, c_company_id, c_date, c_user_id, c_contact_num, c_bill_grp, c_pay_grp, c_org_partner, c_mat_price_grp, c_juris_code, c_tax_class, c_country_code, c_vat_reg_num, c_user_id_data_owner, c_city, c_state, c_postal_code
    FROM ocsumm1.customer
UNION ALL
SELECT
    c_id, c_company_id, c_date, c_user_id, c_contact_num, c_bill_grp, c_pay_grp, c_org_partner, c_mat_price_grp, c_juris_code, c_tax_class, c_country_code, c_vat_reg_num, c_user_id_data_owner, c_city, c_state, c_postal_code
    FROM ocsumm2.customer;


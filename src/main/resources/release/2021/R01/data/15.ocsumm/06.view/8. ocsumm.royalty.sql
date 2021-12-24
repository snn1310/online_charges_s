CREATE OR REPLACE  VIEW ocsumm.royalty (r_id, u_id, c_id, r_domain, r_company_id, r_date, r_usage_type, r_unit_cnt, r_charge_rule, r_royalty_id, r_royalty_data, r_format_code, r_doc_id, r_doc_name, r_doc_pcnt, r_char_cnt, r_line_cnt, r_doc_cnt, r_from_usage_type, r_from_db_name, r_from_udm_ind, r_from_access_meth, r_disp_surcharge_ind, r_from_inplan_hash) AS
SELECT
    r_id, u_id, c_id, r_domain, r_company_id, r_date, r_usage_type, r_unit_cnt, r_charge_rule, r_royalty_id, r_royalty_data, r_format_code, r_doc_id, r_doc_name, r_doc_pcnt, r_char_cnt, r_line_cnt, r_doc_cnt, r_from_usage_type, r_from_db_name, r_from_udm_ind, r_from_access_meth, r_disp_surcharge_ind, r_from_inplan_hash
    FROM ocsumm1.royalty
UNION ALL
SELECT
    r_id, u_id, c_id, r_domain, r_company_id, r_date, r_usage_type, r_unit_cnt, r_charge_rule, r_royalty_id, r_royalty_data, r_format_code, r_doc_id, r_doc_name, r_doc_pcnt, r_char_cnt, r_line_cnt, r_doc_cnt, r_from_usage_type, r_from_db_name, r_from_udm_ind, r_from_access_meth, r_disp_surcharge_ind, r_from_inplan_hash
    FROM ocsumm2.royalty;


CREATE OR REPLACE  VIEW ocsumm.discount_trans_usg (dtu_id, dtu_usage_date, dtu_domain, dtu_user_id, dtu_company_code, dtu_org_partner, dtu_session_id, dtu_doc_name, dtu_doc_id, dtu_timestamp, dtu_offer_id, dtu_data_owner) AS
SELECT
    dtu_id, dtu_usage_date, dtu_domain, dtu_user_id, dtu_company_code, dtu_org_partner, dtu_session_id, dtu_doc_name, dtu_doc_id, dtu_timestamp, dtu_offer_id, dtu_data_owner
    FROM ocsumm1.discount_trans_usg
UNION ALL
SELECT
    dtu_id, dtu_usage_date, dtu_domain, dtu_user_id, dtu_company_code, dtu_org_partner, dtu_session_id, dtu_doc_name, dtu_doc_id, dtu_timestamp, dtu_offer_id, dtu_data_owner
    FROM ocsumm2.discount_trans_usg;


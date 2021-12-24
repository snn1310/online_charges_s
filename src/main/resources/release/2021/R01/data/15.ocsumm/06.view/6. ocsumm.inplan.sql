CREATE OR REPLACE  VIEW ocsumm.inplan (i_id, u_id, c_id, i_domain, i_company_id, i_date, i_database_name, i_access_method) AS
SELECT
    i_id, u_id, c_id, i_domain, i_company_id, i_date, i_database_name, i_access_method
    FROM ocsumm1.inplan
UNION ALL
SELECT
    i_id, u_id, c_id, i_domain, i_company_id, i_date, i_database_name, i_access_method
    FROM ocsumm2.inplan;


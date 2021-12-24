CREATE OR REPLACE  VIEW ocsumm.from_inplan (fi_id, r_id, u_id, c_id, fi_domain, fi_company_id, fi_date, fi_database_name, fi_access_method) AS
SELECT
    fi_id, r_id, u_id, c_id, fi_domain, fi_company_id, fi_date, fi_database_name, fi_access_method
    FROM ocsumm1.from_inplan
UNION ALL
SELECT
    fi_id, r_id, u_id, c_id, fi_domain, fi_company_id, fi_date, fi_database_name, fi_access_method
    FROM ocsumm2.from_inplan;


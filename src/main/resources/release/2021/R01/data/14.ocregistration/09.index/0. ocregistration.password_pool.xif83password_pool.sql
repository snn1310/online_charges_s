CREATE INDEX xif83password_pool
ON ocregistration.password_pool
USING BTREE (pm_domain ASC, pm_company_code ASC, pm_promotion_id ASC);


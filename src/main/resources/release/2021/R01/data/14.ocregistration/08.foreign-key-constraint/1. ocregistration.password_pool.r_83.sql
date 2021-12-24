ALTER TABLE ocregistration.password_pool
ADD CONSTRAINT r_83 FOREIGN KEY (pm_domain, pm_company_code, pm_promotion_id) 
REFERENCES ocregistration.promotion_master (pm_domain, pm_company_code, pm_promotion_id)
ON DELETE NO ACTION;


ALTER TABLE ocregistration.customer_contact
ADD CONSTRAINT r_84 FOREIGN KEY (pp_guid) 
REFERENCES ocregistration.password_pool (pp_guid)
ON DELETE NO ACTION;


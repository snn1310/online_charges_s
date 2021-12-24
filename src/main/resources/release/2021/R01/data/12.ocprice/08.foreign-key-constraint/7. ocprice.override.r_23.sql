ALTER TABLE ocprice.override
ADD CONSTRAINT r_23 FOREIGN KEY (c_domain, c_content_id) 
REFERENCES ocprice.content (c_domain, c_content_id)
ON DELETE NO ACTION;


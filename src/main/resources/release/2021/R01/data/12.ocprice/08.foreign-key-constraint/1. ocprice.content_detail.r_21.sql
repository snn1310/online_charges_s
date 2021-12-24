ALTER TABLE ocprice.content_detail
ADD CONSTRAINT r_21 FOREIGN KEY (c_domain, c_content_id) 
REFERENCES ocprice.content (c_domain, c_content_id)
ON DELETE NO ACTION;


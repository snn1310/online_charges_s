ALTER TABLE ocprice.subscriber_defined
ADD CONSTRAINT r_25 FOREIGN KEY (c_domain, c_content_id) 
REFERENCES ocprice.content (c_domain, c_content_id)
ON DELETE NO ACTION;


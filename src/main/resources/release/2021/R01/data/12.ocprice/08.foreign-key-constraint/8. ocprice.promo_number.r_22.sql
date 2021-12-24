ALTER TABLE ocprice.promo_number
ADD CONSTRAINT r_22 FOREIGN KEY (c_domain, c_content_id) 
REFERENCES ocprice.content (c_domain, c_content_id)
ON DELETE NO ACTION;


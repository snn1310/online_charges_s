ALTER TABLE ocprice.content_exemplar
ADD CONSTRAINT r_27 FOREIGN KEY (c_domain, c_content_id) 
REFERENCES ocprice.content (c_domain, c_content_id)
ON DELETE NO ACTION;


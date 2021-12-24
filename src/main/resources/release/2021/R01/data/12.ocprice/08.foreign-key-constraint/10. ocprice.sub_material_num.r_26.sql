ALTER TABLE ocprice.sub_material_num
ADD CONSTRAINT r_26 FOREIGN KEY (c_domain, c_content_id) 
REFERENCES ocprice.content (c_domain, c_content_id)
ON DELETE NO ACTION;


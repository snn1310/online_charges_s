ALTER TABLE ocprice.material_price_grp
ADD CONSTRAINT r_72 FOREIGN KEY (pri_domain, pri_price_id) 
REFERENCES ocprice.price_id (pri_domain, pri_price_id)
ON DELETE NO ACTION;


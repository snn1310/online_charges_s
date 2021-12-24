ALTER TABLE ocprice.usage_price
ADD CONSTRAINT r_71 FOREIGN KEY (pri_domain, pri_price_id) 
REFERENCES ocprice.price_id (pri_domain, pri_price_id)
ON DELETE NO ACTION;


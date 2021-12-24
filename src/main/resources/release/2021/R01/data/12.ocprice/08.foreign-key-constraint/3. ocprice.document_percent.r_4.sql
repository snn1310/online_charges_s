ALTER TABLE ocprice.document_percent
ADD CONSTRAINT r_4 FOREIGN KEY (pri_domain, pri_price_id) 
REFERENCES ocprice.price_id (pri_domain, pri_price_id)
ON DELETE NO ACTION;


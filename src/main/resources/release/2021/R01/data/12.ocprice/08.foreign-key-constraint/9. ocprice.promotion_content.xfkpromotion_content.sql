ALTER TABLE ocprice.promotion_content
ADD CONSTRAINT xfkpromotion_content FOREIGN KEY (c_domain, c_content_id) 
REFERENCES ocprice.content (c_domain, c_content_id)
ON DELETE NO ACTION;


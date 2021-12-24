ALTER TABLE ocquote.item_discount
ADD CONSTRAINT r_91 FOREIGN KEY (i_id) 
REFERENCES ocquote.item (i_id)
ON DELETE NO ACTION;


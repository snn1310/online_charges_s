ALTER TABLE ocquote.item
ADD CONSTRAINT r_90 FOREIGN KEY (q_id) 
REFERENCES ocquote.quote (q_id)
ON DELETE NO ACTION;


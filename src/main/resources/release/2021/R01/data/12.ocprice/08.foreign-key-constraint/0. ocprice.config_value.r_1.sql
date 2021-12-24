ALTER TABLE ocprice.config_value
ADD CONSTRAINT r_1 FOREIGN KEY (cv_config_item) 
REFERENCES ocprice.config_item (ci_config_item)
ON DELETE NO ACTION;


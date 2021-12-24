ALTER TABLE ocsumm.config_value
ADD CONSTRAINT r_1 FOREIGN KEY (cv_config_item) 
REFERENCES ocsumm.config_item (ci_config_item)
ON DELETE NO ACTION;


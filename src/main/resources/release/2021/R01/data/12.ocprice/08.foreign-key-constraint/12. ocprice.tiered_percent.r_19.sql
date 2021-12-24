ALTER TABLE ocprice.tiered_percent
ADD CONSTRAINT r_19 FOREIGN KEY (mpg_mat_prc_grp) 
REFERENCES ocprice.material_price_grp (mpg_mat_prc_grp)
ON DELETE NO ACTION;


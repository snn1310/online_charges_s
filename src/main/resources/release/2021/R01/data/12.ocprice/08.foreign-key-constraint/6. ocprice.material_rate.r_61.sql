ALTER TABLE ocprice.material_rate
ADD CONSTRAINT r_61 FOREIGN KEY (mpg_mat_prc_grp) 
REFERENCES ocprice.material_price_grp (mpg_mat_prc_grp)
ON DELETE NO ACTION;


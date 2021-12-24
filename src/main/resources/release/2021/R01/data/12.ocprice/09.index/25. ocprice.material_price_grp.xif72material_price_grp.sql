CREATE INDEX xif72material_price_grp
ON ocprice.material_price_grp
USING BTREE (pri_domain ASC, pri_price_id ASC);


CREATE INDEX promotion_ndx2
ON ocprice.promotion
USING BTREE (p_mod_timestamp ASC);


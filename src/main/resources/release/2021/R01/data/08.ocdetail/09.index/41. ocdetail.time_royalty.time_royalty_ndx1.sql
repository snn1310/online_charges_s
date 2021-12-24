CREATE INDEX time_royalty_ndx1
ON ocdetail.time_royalty
USING BTREE (sgd_id DESC, tir_comp_code DESC);


CREATE INDEX database_group_idx$$_103250011
ON ocprice.database_group
USING BTREE (dg_database_name ASC, dg_end_date ASC, dg_domain ASC);


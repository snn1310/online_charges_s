CREATE INDEX xie4subscription
ON ocprice.subscription
USING BTREE (s_alloc_document ASC, s_end_date ASC);


CREATE INDEX subscription_ndx2
ON ocprice.subscription
USING BTREE (s_mod_timestamp ASC);


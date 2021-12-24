CREATE INDEX subscription_idx2
ON ocprice.subscription
USING BTREE (s_level_code ASC, s_domain ASC, s_end_date ASC, s_eff_date ASC, s_storage_key ASC);


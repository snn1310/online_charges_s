CREATE INDEX idx050329140758001
ON ocprice.usage_price
USING BTREE (up_database_name ASC, up_usage_type ASC, pri_price_id ASC, up_billing_method ASC, pri_domain ASC, up_eff_date ASC, up_end_date ASC);


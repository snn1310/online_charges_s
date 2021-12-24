CREATE INDEX xif71usage_price
ON ocprice.usage_price
USING BTREE (pri_domain ASC, pri_price_id ASC);


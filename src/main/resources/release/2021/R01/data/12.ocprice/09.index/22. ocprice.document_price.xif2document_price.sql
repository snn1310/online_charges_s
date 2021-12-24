CREATE INDEX xif2document_price
ON ocprice.document_price
USING BTREE (pri_domain ASC, pri_price_id ASC);


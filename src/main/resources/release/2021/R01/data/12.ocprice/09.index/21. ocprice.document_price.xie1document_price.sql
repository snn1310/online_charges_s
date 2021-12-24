CREATE INDEX xie1document_price
ON ocprice.document_price
USING BTREE (dp_doc_id DESC, pri_price_id DESC);


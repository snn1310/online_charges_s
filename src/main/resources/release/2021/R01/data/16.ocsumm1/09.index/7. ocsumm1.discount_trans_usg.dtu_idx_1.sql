CREATE INDEX dtu_idx_1
ON ocsumm1.discount_trans_usg
USING BTREE (dtu_usage_date ASC, dtu_offer_id ASC);


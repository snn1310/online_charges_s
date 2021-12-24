CREATE INDEX dtu_idx_1
ON ocsumm2.discount_trans_usg
USING BTREE (dtu_usage_date ASC, dtu_offer_id ASC);


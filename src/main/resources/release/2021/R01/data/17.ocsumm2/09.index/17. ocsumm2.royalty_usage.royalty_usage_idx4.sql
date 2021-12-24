CREATE INDEX royalty_usage_idx4
ON ocsumm2.royalty_usage
USING BTREE (ru_from_usage_id ASC, ru_usage_type ASC);


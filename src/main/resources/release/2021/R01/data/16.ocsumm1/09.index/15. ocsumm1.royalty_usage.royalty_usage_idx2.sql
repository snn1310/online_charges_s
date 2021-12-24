CREATE INDEX royalty_usage_idx2
ON ocsumm1.royalty_usage
USING BTREE (ru_company_id ASC, ru_date ASC);


CREATE INDEX usage_ndx2
ON ocsumm1.usage
USING BTREE (c_id ASC, u_database_name ASC, u_usage_type ASC, u_royalty_hash ASC, u_client_id_text ASC);


CREATE INDEX usage_ndx1
ON ocsumm1.usage
USING BTREE (c_id ASC, u_database_name ASC, u_cls_mat_num ASC, u_client_id_text ASC);


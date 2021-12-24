CREATE INDEX error_log_ndx2
ON ocdetail.error_log
USING BTREE (el_user_id ASC);


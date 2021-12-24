CREATE INDEX error_log_ndx1
ON ccdetail4.error_log
USING BTREE (el_ins_timestamp ASC, el_severity_code ASC);


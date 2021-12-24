CREATE INDEX event_history_ndx5
ON ccdetail3.event_history
USING BTREE (eh_user_id ASC);


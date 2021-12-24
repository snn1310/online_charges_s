CREATE INDEX event_history_ndx5
ON ocdetail.event_history
USING BTREE (eh_user_id ASC);


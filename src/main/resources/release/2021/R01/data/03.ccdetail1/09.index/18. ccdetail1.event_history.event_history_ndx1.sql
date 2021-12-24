CREATE INDEX event_history_ndx1
ON ccdetail1.event_history
USING BTREE (eh_session_id ASC, eh_timestamp ASC, eh_seq_num ASC);


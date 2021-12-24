CREATE INDEX event_history_ndx3
ON ccdetail1.event_history
USING BTREE (eh_session_id ASC, eh_event_type ASC);


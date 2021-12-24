CREATE INDEX event_history_ndx3
ON ccdetail2.event_history
USING BTREE (eh_session_id ASC, eh_event_type ASC);


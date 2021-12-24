CREATE INDEX event_history_ndx2
ON ccdetail3.event_history
USING BTREE (eh_domain ASC, eh_timestamp ASC);


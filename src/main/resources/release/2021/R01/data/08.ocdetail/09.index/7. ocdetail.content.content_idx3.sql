CREATE INDEX content_idx3
ON ocdetail.content
USING BTREE (tu_id ASC, con_session_start_date ASC);


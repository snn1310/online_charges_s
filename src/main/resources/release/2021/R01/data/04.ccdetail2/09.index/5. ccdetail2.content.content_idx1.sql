CREATE INDEX content_idx1
ON ccdetail2.content
USING BTREE (con_session_start_date ASC, tu_id ASC);


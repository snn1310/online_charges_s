CREATE INDEX content_idx1
ON ccdetail1.content
USING BTREE (con_session_start_date ASC, tu_id ASC);


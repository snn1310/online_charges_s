CREATE INDEX jurisdiction_idx1
ON ocdetail.jurisdiction
USING BTREE (tu_id ASC, j_session_start_date ASC);


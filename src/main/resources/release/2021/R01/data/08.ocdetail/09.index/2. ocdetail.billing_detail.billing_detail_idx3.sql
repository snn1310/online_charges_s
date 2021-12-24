CREATE INDEX billing_detail_idx3
ON ocdetail.billing_detail
USING BTREE (bd_client_id_text ASC, bd_visible_code ASC, bd_session_start_date ASC);


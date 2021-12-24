CREATE INDEX billing_detail_idx4
ON ccdetail2.billing_detail
USING BTREE (cd_id ASC, bd_id ASC, bd_client_id_text ASC, bd_visible_code ASC, bd_session_start_date ASC);


ALTER TABLE ocdetail.usg_billing_detail
ADD CONSTRAINT usg_billing_detail_pk PRIMARY KEY (ubd_usage_id, bd_id, ubd_session_start_date);


CREATE INDEX customer_detail_ndx2
ON ccdetail2.customer_detail
USING BTREE (cd_bill_grp ASC, cd_session_start_date ASC);


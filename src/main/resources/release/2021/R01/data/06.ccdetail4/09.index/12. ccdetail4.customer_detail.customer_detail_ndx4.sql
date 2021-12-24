CREATE INDEX customer_detail_ndx4
ON ccdetail4.customer_detail
USING BTREE (cd_contact_num ASC, cd_bill_grp ASC);


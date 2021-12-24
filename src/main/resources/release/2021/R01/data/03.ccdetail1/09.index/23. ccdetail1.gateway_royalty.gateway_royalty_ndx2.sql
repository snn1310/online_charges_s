CREATE INDEX gateway_royalty_ndx2
ON ccdetail1.gateway_royalty
USING BTREE (sgd_id ASC, gr_locate_doc_cnt ASC, gr_image_req_cnt ASC, gr_cite_view_cnt ASC, gr_cite_req_cnt ASC, gr_doc_view_cnt ASC, gr_doc_req_cnt ASC, gr_pool_code ASC, gr_timestamp ASC, gr_database_name ASC, gr_gateway_type ASC, gr_id ASC);


CREATE INDEX idx503130018400000
ON ocprice.content_detail
USING BTREE (c_content_id ASC, c_domain ASC, cd_company_code ASC, cd_eff_date ASC, cd_end_date ASC);


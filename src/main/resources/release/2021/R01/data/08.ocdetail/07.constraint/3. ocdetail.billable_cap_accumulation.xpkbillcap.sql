ALTER TABLE ocdetail.billable_cap_accumulation
ADD CONSTRAINT xpkbillcap PRIMARY KEY (bo_id, bca_eff_date, bca_client_expr);


CREATE INDEX idx503122357030000
ON ocprice.vendor_code
USING BTREE (vc_price_code ASC, vc_domain ASC, vc_company_code ASC, vc_end_date ASC, vc_eff_date ASC, vc_mod_timestamp ASC, vc_modified_by ASC, vc_vendor_desc ASC, vc_vendor_code ASC);


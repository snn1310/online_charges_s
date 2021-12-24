ALTER TABLE ocprice.user_adjustment
ADD CONSTRAINT xpkuser_adjustment PRIMARY KEY (ua_sub_mat_num, ua_domain, ua_adjust_type, ua_adjust_value, ua_registration_type, ua_source_id, ua_eff_date);


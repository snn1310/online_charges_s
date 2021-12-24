CREATE INDEX profile_instance_data_ndx1
ON ocentitlements.profile_instance_data
USING BTREE (pid_level_value ASC, pid_eff_date ASC, pid_end_date ASC, pid_level_code ASC, sg_domain ASC);


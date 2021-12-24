ALTER TABLE ocsumm.daily_total
ADD CONSTRAINT xpkdaily_totals PRIMARY KEY (dt_company_id, dt_usage_date, dt_usage_type, dt_domain, dt_table_name, dt_incl_excl_ind);


ALTER TABLE ocdetail.analytics_totals
ADD CONSTRAINT xpkanalytics_totals PRIMARY KEY (at_usage_date, at_usage_type, at_incl_excl_ind, at_visible_code, at_onl_serv_type);


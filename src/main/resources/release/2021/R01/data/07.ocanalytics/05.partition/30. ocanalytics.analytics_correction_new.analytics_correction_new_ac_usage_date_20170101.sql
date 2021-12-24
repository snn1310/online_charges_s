CREATE TABLE ocanalytics.analytics_correction_new_ac_usage_date_20170101
        PARTITION OF ocanalytics.analytics_correction_new
        FOR VALUES FROM (MINVALUE) TO ('2017-01-01 00:00:00');


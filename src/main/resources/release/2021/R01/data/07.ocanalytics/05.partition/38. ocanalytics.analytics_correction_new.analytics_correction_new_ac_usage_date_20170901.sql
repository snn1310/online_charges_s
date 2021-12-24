CREATE TABLE ocanalytics.analytics_correction_new_ac_usage_date_20170901
        PARTITION OF ocanalytics.analytics_correction_new
        FOR VALUES FROM ('2017-08-01 00:00:00') TO ('2017-09-01 00:00:00');


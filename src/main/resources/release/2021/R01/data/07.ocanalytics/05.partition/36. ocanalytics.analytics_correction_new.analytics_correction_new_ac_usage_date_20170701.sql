CREATE TABLE ocanalytics.analytics_correction_new_ac_usage_date_20170701
        PARTITION OF ocanalytics.analytics_correction_new
        FOR VALUES FROM ('2017-06-01 00:00:00') TO ('2017-07-01 00:00:00');


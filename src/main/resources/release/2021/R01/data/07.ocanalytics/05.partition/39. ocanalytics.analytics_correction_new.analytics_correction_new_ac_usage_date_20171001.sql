CREATE TABLE ocanalytics.analytics_correction_new_ac_usage_date_20171001
        PARTITION OF ocanalytics.analytics_correction_new
        FOR VALUES FROM ('2017-09-01 00:00:00') TO ('2017-10-01 00:00:00');


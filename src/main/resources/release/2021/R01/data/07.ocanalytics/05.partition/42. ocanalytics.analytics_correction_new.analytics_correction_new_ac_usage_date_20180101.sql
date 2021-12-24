CREATE TABLE ocanalytics.analytics_correction_new_ac_usage_date_20180101
        PARTITION OF ocanalytics.analytics_correction_new
        FOR VALUES FROM ('2017-12-01 00:00:00') TO ('2018-01-01 00:00:00');


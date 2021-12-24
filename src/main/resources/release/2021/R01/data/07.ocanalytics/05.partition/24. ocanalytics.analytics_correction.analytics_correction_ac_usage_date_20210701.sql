CREATE TABLE ocanalytics.analytics_correction_ac_usage_date_20210701
        PARTITION OF ocanalytics.analytics_correction
        FOR VALUES FROM ('2021-06-01 00:00:00') TO ('2021-07-01 00:00:00');


CREATE TABLE ocanalytics.analytics_correction_ac_usage_date_20210301
        PARTITION OF ocanalytics.analytics_correction
        FOR VALUES FROM ('2021-02-01 00:00:00') TO ('2021-03-01 00:00:00');


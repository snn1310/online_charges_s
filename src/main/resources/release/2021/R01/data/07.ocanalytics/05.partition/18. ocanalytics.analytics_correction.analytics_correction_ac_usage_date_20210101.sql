CREATE TABLE ocanalytics.analytics_correction_ac_usage_date_20210101
        PARTITION OF ocanalytics.analytics_correction
        FOR VALUES FROM ('2020-12-01 00:00:00') TO ('2021-01-01 00:00:00');


CREATE TABLE ocanalytics.analytics_correction_ac_usage_date_20211101
        PARTITION OF ocanalytics.analytics_correction
        FOR VALUES FROM ('2021-10-01 00:00:00') TO ('2021-11-01 00:00:00');


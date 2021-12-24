CREATE TABLE ocanalytics.analytics_correction_ac_usage_date_20200101
        PARTITION OF ocanalytics.analytics_correction
        FOR VALUES FROM ('2019-12-01 00:00:00') TO ('2020-01-01 00:00:00');


CREATE TABLE ocanalytics.analytics_correction_ac_usage_date_20211201
        PARTITION OF ocanalytics.analytics_correction
        FOR VALUES FROM ('2021-11-01 00:00:00') TO ('2021-12-01 00:00:00');


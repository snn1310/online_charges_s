CREATE TABLE ocanalytics.analytics_correction_ac_usage_date_20201201
        PARTITION OF ocanalytics.analytics_correction
        FOR VALUES FROM ('2020-11-01 00:00:00') TO ('2020-12-01 00:00:00');


CREATE TABLE ocanalytics.analytics_correction_ac_usage_date_20200401
        PARTITION OF ocanalytics.analytics_correction
        FOR VALUES FROM ('2020-03-01 00:00:00') TO ('2020-04-01 00:00:00');


CREATE TABLE ocanalytics.analytics_correction_ac_usage_date_20200701
        PARTITION OF ocanalytics.analytics_correction
        FOR VALUES FROM ('2020-06-01 00:00:00') TO ('2020-07-01 00:00:00');


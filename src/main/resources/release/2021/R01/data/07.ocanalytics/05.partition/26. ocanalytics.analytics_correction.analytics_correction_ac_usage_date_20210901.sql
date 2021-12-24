CREATE TABLE ocanalytics.analytics_correction_ac_usage_date_20210901
        PARTITION OF ocanalytics.analytics_correction
        FOR VALUES FROM ('2021-08-01 00:00:00') TO ('2021-09-01 00:00:00');


CREATE TABLE ocanalytics.analytics_correction_ac_usage_date_20200901
        PARTITION OF ocanalytics.analytics_correction
        FOR VALUES FROM ('2020-08-01 00:00:00') TO ('2020-09-01 00:00:00');


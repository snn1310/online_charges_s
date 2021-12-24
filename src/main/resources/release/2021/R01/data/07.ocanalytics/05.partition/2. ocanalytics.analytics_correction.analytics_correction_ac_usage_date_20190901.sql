CREATE TABLE ocanalytics.analytics_correction_ac_usage_date_20190901
        PARTITION OF ocanalytics.analytics_correction
        FOR VALUES FROM ('2019-08-01 00:00:00') TO ('2019-09-01 00:00:00');


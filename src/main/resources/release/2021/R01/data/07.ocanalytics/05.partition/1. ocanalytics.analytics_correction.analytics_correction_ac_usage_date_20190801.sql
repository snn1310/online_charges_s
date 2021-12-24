CREATE TABLE ocanalytics.analytics_correction_ac_usage_date_20190801
        PARTITION OF ocanalytics.analytics_correction
        FOR VALUES FROM ('2019-07-01 00:00:00') TO ('2019-08-01 00:00:00');


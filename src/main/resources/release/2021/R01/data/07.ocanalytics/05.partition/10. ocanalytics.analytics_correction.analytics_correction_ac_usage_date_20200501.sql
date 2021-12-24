CREATE TABLE ocanalytics.analytics_correction_ac_usage_date_20200501
        PARTITION OF ocanalytics.analytics_correction
        FOR VALUES FROM ('2020-04-01 00:00:00') TO ('2020-05-01 00:00:00');


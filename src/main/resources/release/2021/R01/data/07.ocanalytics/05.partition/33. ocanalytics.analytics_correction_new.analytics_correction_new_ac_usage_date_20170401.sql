CREATE TABLE ocanalytics.analytics_correction_new_ac_usage_date_20170401
        PARTITION OF ocanalytics.analytics_correction_new
        FOR VALUES FROM ('2017-03-01 00:00:00') TO ('2017-04-01 00:00:00');


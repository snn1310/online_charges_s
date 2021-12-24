CREATE TABLE ocanalytics.analytics_correction_ac_usage_date_20190701
        PARTITION OF ocanalytics.analytics_correction
        FOR VALUES FROM (MINVALUE) TO ('2019-07-01 00:00:00');


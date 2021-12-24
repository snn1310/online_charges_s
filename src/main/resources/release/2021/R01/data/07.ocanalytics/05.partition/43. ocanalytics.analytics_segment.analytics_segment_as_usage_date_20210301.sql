CREATE TABLE ocanalytics.analytics_segment_as_usage_date_20210301
        PARTITION OF ocanalytics.analytics_segment
        FOR VALUES FROM (MINVALUE) TO ('2021-03-01 00:00:00');


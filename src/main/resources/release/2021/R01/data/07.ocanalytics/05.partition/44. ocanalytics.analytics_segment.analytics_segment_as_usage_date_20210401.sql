CREATE TABLE ocanalytics.analytics_segment_as_usage_date_20210401
        PARTITION OF ocanalytics.analytics_segment
        FOR VALUES FROM ('2021-03-01 00:00:00') TO ('2021-04-01 00:00:00');


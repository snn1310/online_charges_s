CREATE TABLE ocanalytics.analytics_segment_as_usage_date_20210801
        PARTITION OF ocanalytics.analytics_segment
        FOR VALUES FROM ('2021-07-01 00:00:00') TO ('2021-08-01 00:00:00');


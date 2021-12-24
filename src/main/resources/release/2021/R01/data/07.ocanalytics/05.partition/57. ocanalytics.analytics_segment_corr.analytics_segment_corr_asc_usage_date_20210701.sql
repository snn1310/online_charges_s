CREATE TABLE ocanalytics.analytics_segment_corr_asc_usage_date_20210701
        PARTITION OF ocanalytics.analytics_segment_corr
        FOR VALUES FROM ('2021-06-01 00:00:00') TO ('2021-07-01 00:00:00');


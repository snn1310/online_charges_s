CREATE TABLE ocanalytics.analytics_segment_corr_asc_usage_date_20210501
        PARTITION OF ocanalytics.analytics_segment_corr
        FOR VALUES FROM ('2021-04-01 00:00:00') TO ('2021-05-01 00:00:00');


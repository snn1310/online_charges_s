CREATE TABLE ocanalytics.analytics_segment_corr_asc_usage_date_20210301
        PARTITION OF ocanalytics.analytics_segment_corr
        FOR VALUES FROM (MINVALUE) TO ('2021-03-01 00:00:00');


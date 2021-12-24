CREATE TABLE ocanalytics.analytics_transaction_corr_atc_usage_date_20210301
        PARTITION OF ocanalytics.analytics_transaction_corr
        FOR VALUES FROM (MINVALUE) TO ('2021-03-01 00:00:00');


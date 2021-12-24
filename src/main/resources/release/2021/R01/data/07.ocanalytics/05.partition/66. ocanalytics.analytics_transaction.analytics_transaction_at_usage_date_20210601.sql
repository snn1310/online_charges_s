CREATE TABLE ocanalytics.analytics_transaction_at_usage_date_20210601
        PARTITION OF ocanalytics.analytics_transaction
        FOR VALUES FROM ('2021-05-01 00:00:00') TO ('2021-06-01 00:00:00');


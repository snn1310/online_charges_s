CREATE TABLE ccdetail1.transaction_usage_gentime_20210815
        PARTITION OF ccdetail1.transaction_usage
        FOR VALUES FROM (MINVALUE) TO ('2021-08-15 00:00:00');


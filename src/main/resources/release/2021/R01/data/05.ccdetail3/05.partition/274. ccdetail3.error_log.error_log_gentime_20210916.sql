CREATE TABLE ccdetail3.error_log_gentime_20210916
        PARTITION OF ccdetail3.error_log
        FOR VALUES FROM ('2021-09-15 00:00:00') TO ('2021-09-16 00:00:00');


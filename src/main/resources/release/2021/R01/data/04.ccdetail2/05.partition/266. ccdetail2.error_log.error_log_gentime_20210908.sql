CREATE TABLE ccdetail2.error_log_gentime_20210908
        PARTITION OF ccdetail2.error_log
        FOR VALUES FROM ('2021-09-07 00:00:00') TO ('2021-09-08 00:00:00');


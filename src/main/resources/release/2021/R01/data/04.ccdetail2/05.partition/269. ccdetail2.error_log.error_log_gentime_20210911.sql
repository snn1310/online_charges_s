CREATE TABLE ccdetail2.error_log_gentime_20210911
        PARTITION OF ccdetail2.error_log
        FOR VALUES FROM ('2021-09-10 00:00:00') TO ('2021-09-11 00:00:00');

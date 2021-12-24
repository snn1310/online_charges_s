CREATE TABLE ccdetail2.error_log_gentime_20210904
        PARTITION OF ccdetail2.error_log
        FOR VALUES FROM ('2021-09-03 00:00:00') TO ('2021-09-04 00:00:00');


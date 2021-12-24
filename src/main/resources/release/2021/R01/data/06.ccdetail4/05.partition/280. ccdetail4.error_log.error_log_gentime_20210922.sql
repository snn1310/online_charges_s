CREATE TABLE ccdetail4.error_log_gentime_20210922
        PARTITION OF ccdetail4.error_log
        FOR VALUES FROM ('2021-09-21 00:00:00') TO ('2021-09-22 00:00:00');


CREATE TABLE ccdetail4.error_log_gentime_20211013
        PARTITION OF ccdetail4.error_log
        FOR VALUES FROM ('2021-10-12 00:00:00') TO ('2021-10-13 00:00:00');


CREATE TABLE ccdetail4.error_log_gentime_20211011
        PARTITION OF ccdetail4.error_log
        FOR VALUES FROM ('2021-10-10 00:00:00') TO ('2021-10-11 00:00:00');


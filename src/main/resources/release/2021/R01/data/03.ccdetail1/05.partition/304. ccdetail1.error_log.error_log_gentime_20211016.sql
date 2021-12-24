CREATE TABLE ccdetail1.error_log_gentime_20211016
        PARTITION OF ccdetail1.error_log
        FOR VALUES FROM ('2021-10-15 00:00:00') TO ('2021-10-16 00:00:00');


CREATE TABLE ccdetail1.error_log_gentime_20211007
        PARTITION OF ccdetail1.error_log
        FOR VALUES FROM ('2021-10-06 00:00:00') TO ('2021-10-07 00:00:00');


CREATE TABLE ccdetail3.error_log_gentime_20210913
        PARTITION OF ccdetail3.error_log
        FOR VALUES FROM ('2021-09-12 00:00:00') TO ('2021-09-13 00:00:00');


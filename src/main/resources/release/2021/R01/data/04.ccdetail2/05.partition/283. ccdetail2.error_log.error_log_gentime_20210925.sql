CREATE TABLE ccdetail2.error_log_gentime_20210925
        PARTITION OF ccdetail2.error_log
        FOR VALUES FROM ('2021-09-24 00:00:00') TO ('2021-09-25 00:00:00');


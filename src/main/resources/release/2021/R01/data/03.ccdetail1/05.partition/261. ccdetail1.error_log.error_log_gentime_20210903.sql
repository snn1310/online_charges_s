CREATE TABLE ccdetail1.error_log_gentime_20210903
        PARTITION OF ccdetail1.error_log
        FOR VALUES FROM ('2021-09-02 00:00:00') TO ('2021-09-03 00:00:00');


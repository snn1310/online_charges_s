CREATE TABLE ccdetail2.error_log_gentime_20210829
        PARTITION OF ccdetail2.error_log
        FOR VALUES FROM (MINVALUE) TO ('2021-08-29 00:00:00');


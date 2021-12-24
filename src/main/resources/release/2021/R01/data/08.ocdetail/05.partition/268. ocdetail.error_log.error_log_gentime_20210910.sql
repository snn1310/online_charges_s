CREATE TABLE ocdetail.error_log_gentime_20210910
        PARTITION OF ocdetail.error_log
        FOR VALUES FROM ('2021-09-09 00:00:00') TO ('2021-09-10 00:00:00');


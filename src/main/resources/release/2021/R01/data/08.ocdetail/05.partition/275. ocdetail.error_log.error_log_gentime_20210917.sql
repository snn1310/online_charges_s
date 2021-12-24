CREATE TABLE ocdetail.error_log_gentime_20210917
        PARTITION OF ocdetail.error_log
        FOR VALUES FROM ('2021-09-16 00:00:00') TO ('2021-09-17 00:00:00');


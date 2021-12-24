CREATE TABLE ocdetail.error_log_gentime_20210915
        PARTITION OF ocdetail.error_log
        FOR VALUES FROM ('2021-09-14 00:00:00') TO ('2021-09-15 00:00:00');


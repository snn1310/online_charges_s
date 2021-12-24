CREATE TABLE ocdetail.error_log_gentime_20211010
        PARTITION OF ocdetail.error_log
        FOR VALUES FROM ('2021-10-09 00:00:00') TO ('2021-10-10 00:00:00');


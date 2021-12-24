CREATE TABLE ocdetail.error_log_gentime_20210830
        PARTITION OF ocdetail.error_log
        FOR VALUES FROM ('2021-08-29 00:00:00') TO ('2021-08-30 00:00:00');


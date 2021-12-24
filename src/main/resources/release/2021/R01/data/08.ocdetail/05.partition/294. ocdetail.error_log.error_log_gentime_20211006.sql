CREATE TABLE ocdetail.error_log_gentime_20211006
        PARTITION OF ocdetail.error_log
        FOR VALUES FROM ('2021-10-05 00:00:00') TO ('2021-10-06 00:00:00');


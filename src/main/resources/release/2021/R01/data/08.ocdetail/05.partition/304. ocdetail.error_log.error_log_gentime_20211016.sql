CREATE TABLE ocdetail.error_log_gentime_20211016
        PARTITION OF ocdetail.error_log
        FOR VALUES FROM ('2021-10-15 00:00:00') TO ('2021-10-16 00:00:00');


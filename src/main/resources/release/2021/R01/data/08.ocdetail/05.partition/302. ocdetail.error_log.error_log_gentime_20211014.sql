CREATE TABLE ocdetail.error_log_gentime_20211014
        PARTITION OF ocdetail.error_log
        FOR VALUES FROM ('2021-10-13 00:00:00') TO ('2021-10-14 00:00:00');


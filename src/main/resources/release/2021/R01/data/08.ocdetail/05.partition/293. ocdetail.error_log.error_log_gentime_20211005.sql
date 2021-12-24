CREATE TABLE ocdetail.error_log_gentime_20211005
        PARTITION OF ocdetail.error_log
        FOR VALUES FROM ('2021-10-04 00:00:00') TO ('2021-10-05 00:00:00');


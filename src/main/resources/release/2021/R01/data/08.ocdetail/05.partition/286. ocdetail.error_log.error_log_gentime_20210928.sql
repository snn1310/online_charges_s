CREATE TABLE ocdetail.error_log_gentime_20210928
        PARTITION OF ocdetail.error_log
        FOR VALUES FROM ('2021-09-27 00:00:00') TO ('2021-09-28 00:00:00');


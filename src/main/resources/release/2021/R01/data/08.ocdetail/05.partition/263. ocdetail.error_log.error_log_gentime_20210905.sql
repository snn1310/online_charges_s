CREATE TABLE ocdetail.error_log_gentime_20210905
        PARTITION OF ocdetail.error_log
        FOR VALUES FROM ('2021-09-04 00:00:00') TO ('2021-09-05 00:00:00');


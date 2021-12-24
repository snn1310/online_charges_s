CREATE TABLE ocdetail.error_log_gentime_20210913
        PARTITION OF ocdetail.error_log
        FOR VALUES FROM ('2021-09-12 00:00:00') TO ('2021-09-13 00:00:00');


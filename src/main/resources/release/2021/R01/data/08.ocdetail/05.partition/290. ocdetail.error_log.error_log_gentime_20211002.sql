CREATE TABLE ocdetail.error_log_gentime_20211002
        PARTITION OF ocdetail.error_log
        FOR VALUES FROM ('2021-10-01 00:00:00') TO ('2021-10-02 00:00:00');


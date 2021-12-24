CREATE TABLE ccdetail1.error_log_gentime_20210906
        PARTITION OF ccdetail1.error_log
        FOR VALUES FROM ('2021-09-05 00:00:00') TO ('2021-09-06 00:00:00');


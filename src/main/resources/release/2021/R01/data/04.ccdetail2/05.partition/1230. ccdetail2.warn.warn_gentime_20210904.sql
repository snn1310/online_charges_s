CREATE TABLE ccdetail2.warn_gentime_20210904
        PARTITION OF ccdetail2.warn
        FOR VALUES FROM ('2021-09-03 00:00:00') TO ('2021-09-04 00:00:00');


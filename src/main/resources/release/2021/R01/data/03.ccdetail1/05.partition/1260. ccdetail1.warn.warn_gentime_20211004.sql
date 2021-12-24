CREATE TABLE ccdetail1.warn_gentime_20211004
        PARTITION OF ccdetail1.warn
        FOR VALUES FROM ('2021-10-03 00:00:00') TO ('2021-10-04 00:00:00');


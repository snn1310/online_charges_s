CREATE TABLE ccdetail2.warn_gentime_20211010
        PARTITION OF ccdetail2.warn
        FOR VALUES FROM ('2021-10-09 00:00:00') TO ('2021-10-10 00:00:00');

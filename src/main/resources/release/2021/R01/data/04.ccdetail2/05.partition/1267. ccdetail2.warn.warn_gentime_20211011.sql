CREATE TABLE ccdetail2.warn_gentime_20211011
        PARTITION OF ccdetail2.warn
        FOR VALUES FROM ('2021-10-10 00:00:00') TO ('2021-10-11 00:00:00');


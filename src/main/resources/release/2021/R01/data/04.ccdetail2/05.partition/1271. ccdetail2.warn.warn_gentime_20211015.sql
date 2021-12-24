CREATE TABLE ccdetail2.warn_gentime_20211015
        PARTITION OF ccdetail2.warn
        FOR VALUES FROM ('2021-10-14 00:00:00') TO ('2021-10-15 00:00:00');


CREATE TABLE ccdetail1.warn_gentime_20211015
        PARTITION OF ccdetail1.warn
        FOR VALUES FROM ('2021-10-14 00:00:00') TO ('2021-10-15 00:00:00');


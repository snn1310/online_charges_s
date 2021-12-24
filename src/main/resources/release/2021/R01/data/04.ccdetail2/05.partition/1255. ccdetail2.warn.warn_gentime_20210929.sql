CREATE TABLE ccdetail2.warn_gentime_20210929
        PARTITION OF ccdetail2.warn
        FOR VALUES FROM ('2021-09-28 00:00:00') TO ('2021-09-29 00:00:00');


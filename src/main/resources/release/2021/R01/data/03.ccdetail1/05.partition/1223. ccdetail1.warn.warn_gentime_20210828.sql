CREATE TABLE ccdetail1.warn_gentime_20210828
        PARTITION OF ccdetail1.warn
        FOR VALUES FROM ('2021-08-27 00:00:00') TO ('2021-08-28 00:00:00');

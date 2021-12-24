CREATE TABLE ccdetail4.warn_gentime_20210815
        PARTITION OF ccdetail4.warn
        FOR VALUES FROM (MINVALUE) TO ('2021-08-15 00:00:00');


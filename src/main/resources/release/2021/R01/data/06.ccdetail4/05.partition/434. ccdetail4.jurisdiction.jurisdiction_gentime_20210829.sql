CREATE TABLE ccdetail4.jurisdiction_gentime_20210829
        PARTITION OF ccdetail4.jurisdiction
        FOR VALUES FROM ('2021-08-28 00:00:00') TO ('2021-08-29 00:00:00');


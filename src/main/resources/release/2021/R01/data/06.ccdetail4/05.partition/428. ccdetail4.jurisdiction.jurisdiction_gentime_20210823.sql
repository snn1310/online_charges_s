CREATE TABLE ccdetail4.jurisdiction_gentime_20210823
        PARTITION OF ccdetail4.jurisdiction
        FOR VALUES FROM ('2021-08-22 00:00:00') TO ('2021-08-23 00:00:00');


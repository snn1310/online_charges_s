CREATE TABLE ccdetail4.jurisdiction_gentime_20210825
        PARTITION OF ccdetail4.jurisdiction
        FOR VALUES FROM ('2021-08-24 00:00:00') TO ('2021-08-25 00:00:00');

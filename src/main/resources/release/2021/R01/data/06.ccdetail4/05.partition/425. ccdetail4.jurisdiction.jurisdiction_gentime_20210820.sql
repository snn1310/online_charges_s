CREATE TABLE ccdetail4.jurisdiction_gentime_20210820
        PARTITION OF ccdetail4.jurisdiction
        FOR VALUES FROM ('2021-08-19 00:00:00') TO ('2021-08-20 00:00:00');


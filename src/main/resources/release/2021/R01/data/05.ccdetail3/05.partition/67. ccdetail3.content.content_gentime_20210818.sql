CREATE TABLE ccdetail3.content_gentime_20210818
        PARTITION OF ccdetail3.content
        FOR VALUES FROM ('2021-08-17 00:00:00') TO ('2021-08-18 00:00:00');


CREATE TABLE ccdetail3.content_gentime_20210817
        PARTITION OF ccdetail3.content
        FOR VALUES FROM ('2021-08-16 00:00:00') TO ('2021-08-17 00:00:00');


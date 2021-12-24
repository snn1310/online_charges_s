CREATE TABLE ccdetail3.content_gentime_20210831
        PARTITION OF ccdetail3.content
        FOR VALUES FROM ('2021-08-30 00:00:00') TO ('2021-08-31 00:00:00');


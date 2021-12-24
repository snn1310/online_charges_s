CREATE TABLE ccdetail3.content_gentime_20210924
        PARTITION OF ccdetail3.content
        FOR VALUES FROM ('2021-09-23 00:00:00') TO ('2021-09-24 00:00:00');


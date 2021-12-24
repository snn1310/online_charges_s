CREATE TABLE ccdetail3.content_gentime_20210825
        PARTITION OF ccdetail3.content
        FOR VALUES FROM ('2021-08-24 00:00:00') TO ('2021-08-25 00:00:00');


CREATE TABLE ccdetail3.content_gentime_20210926
        PARTITION OF ccdetail3.content
        FOR VALUES FROM ('2021-09-25 00:00:00') TO ('2021-09-26 00:00:00');


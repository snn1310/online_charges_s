CREATE TABLE ccdetail3.content_gentime_20210912
        PARTITION OF ccdetail3.content
        FOR VALUES FROM ('2021-09-11 00:00:00') TO ('2021-09-12 00:00:00');

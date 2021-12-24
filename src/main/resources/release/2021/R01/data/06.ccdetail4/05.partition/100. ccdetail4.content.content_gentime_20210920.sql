CREATE TABLE ccdetail4.content_gentime_20210920
        PARTITION OF ccdetail4.content
        FOR VALUES FROM ('2021-09-19 00:00:00') TO ('2021-09-20 00:00:00');


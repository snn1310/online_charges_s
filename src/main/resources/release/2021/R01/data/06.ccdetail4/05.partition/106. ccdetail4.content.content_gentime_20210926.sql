CREATE TABLE ccdetail4.content_gentime_20210926
        PARTITION OF ccdetail4.content
        FOR VALUES FROM ('2021-09-25 00:00:00') TO ('2021-09-26 00:00:00');


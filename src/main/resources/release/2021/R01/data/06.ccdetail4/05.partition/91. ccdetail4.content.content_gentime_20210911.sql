CREATE TABLE ccdetail4.content_gentime_20210911
        PARTITION OF ccdetail4.content
        FOR VALUES FROM ('2021-09-10 00:00:00') TO ('2021-09-11 00:00:00');


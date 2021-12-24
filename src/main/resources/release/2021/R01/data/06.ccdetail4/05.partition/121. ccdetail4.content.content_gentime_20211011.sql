CREATE TABLE ccdetail4.content_gentime_20211011
        PARTITION OF ccdetail4.content
        FOR VALUES FROM ('2021-10-10 00:00:00') TO ('2021-10-11 00:00:00');


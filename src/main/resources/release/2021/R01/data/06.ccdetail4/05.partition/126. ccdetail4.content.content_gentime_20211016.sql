CREATE TABLE ccdetail4.content_gentime_20211016
        PARTITION OF ccdetail4.content
        FOR VALUES FROM ('2021-10-15 00:00:00') TO ('2021-10-16 00:00:00');


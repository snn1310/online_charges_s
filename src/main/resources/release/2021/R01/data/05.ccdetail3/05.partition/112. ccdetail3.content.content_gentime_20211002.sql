CREATE TABLE ccdetail3.content_gentime_20211002
        PARTITION OF ccdetail3.content
        FOR VALUES FROM ('2021-10-01 00:00:00') TO ('2021-10-02 00:00:00');


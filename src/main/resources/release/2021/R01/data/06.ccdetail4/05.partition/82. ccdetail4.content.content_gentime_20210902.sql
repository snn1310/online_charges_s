CREATE TABLE ccdetail4.content_gentime_20210902
        PARTITION OF ccdetail4.content
        FOR VALUES FROM ('2021-09-01 00:00:00') TO ('2021-09-02 00:00:00');


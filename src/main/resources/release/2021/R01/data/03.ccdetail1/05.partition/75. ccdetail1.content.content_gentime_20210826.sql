CREATE TABLE ccdetail1.content_gentime_20210826
        PARTITION OF ccdetail1.content
        FOR VALUES FROM ('2021-08-25 00:00:00') TO ('2021-08-26 00:00:00');

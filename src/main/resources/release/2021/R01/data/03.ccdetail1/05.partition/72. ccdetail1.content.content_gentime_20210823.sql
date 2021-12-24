CREATE TABLE ccdetail1.content_gentime_20210823
        PARTITION OF ccdetail1.content
        FOR VALUES FROM ('2021-08-22 00:00:00') TO ('2021-08-23 00:00:00');


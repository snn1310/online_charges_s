CREATE TABLE ccdetail1.content_gentime_20211007
        PARTITION OF ccdetail1.content
        FOR VALUES FROM ('2021-10-06 00:00:00') TO ('2021-10-07 00:00:00');

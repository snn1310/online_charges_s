CREATE TABLE ccdetail3.content_gentime_20210830
        PARTITION OF ccdetail3.content
        FOR VALUES FROM ('2021-08-29 00:00:00') TO ('2021-08-30 00:00:00');


CREATE TABLE ccdetail3.content_gentime_20210907
        PARTITION OF ccdetail3.content
        FOR VALUES FROM ('2021-09-06 00:00:00') TO ('2021-09-07 00:00:00');


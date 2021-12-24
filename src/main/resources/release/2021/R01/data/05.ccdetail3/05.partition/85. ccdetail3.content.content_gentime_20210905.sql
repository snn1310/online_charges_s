CREATE TABLE ccdetail3.content_gentime_20210905
        PARTITION OF ccdetail3.content
        FOR VALUES FROM ('2021-09-04 00:00:00') TO ('2021-09-05 00:00:00');


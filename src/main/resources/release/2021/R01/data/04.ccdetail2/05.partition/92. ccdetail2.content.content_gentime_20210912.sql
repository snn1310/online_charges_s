CREATE TABLE ccdetail2.content_gentime_20210912
        PARTITION OF ccdetail2.content
        FOR VALUES FROM ('2021-09-11 00:00:00') TO ('2021-09-12 00:00:00');


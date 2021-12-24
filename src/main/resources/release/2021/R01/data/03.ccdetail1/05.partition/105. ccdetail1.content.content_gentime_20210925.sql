CREATE TABLE ccdetail1.content_gentime_20210925
        PARTITION OF ccdetail1.content
        FOR VALUES FROM ('2021-09-24 00:00:00') TO ('2021-09-25 00:00:00');


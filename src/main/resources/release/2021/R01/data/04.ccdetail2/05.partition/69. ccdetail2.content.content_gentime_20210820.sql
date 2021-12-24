CREATE TABLE ccdetail2.content_gentime_20210820
        PARTITION OF ccdetail2.content
        FOR VALUES FROM ('2021-08-19 00:00:00') TO ('2021-08-20 00:00:00');


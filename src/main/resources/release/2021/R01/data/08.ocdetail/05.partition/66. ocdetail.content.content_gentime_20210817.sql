CREATE TABLE ocdetail.content_gentime_20210817
        PARTITION OF ocdetail.content
        FOR VALUES FROM ('2021-08-16 00:00:00') TO ('2021-08-17 00:00:00');


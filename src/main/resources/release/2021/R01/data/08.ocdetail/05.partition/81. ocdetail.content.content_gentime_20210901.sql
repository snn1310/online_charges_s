CREATE TABLE ocdetail.content_gentime_20210901
        PARTITION OF ocdetail.content
        FOR VALUES FROM ('2021-08-31 00:00:00') TO ('2021-09-01 00:00:00');


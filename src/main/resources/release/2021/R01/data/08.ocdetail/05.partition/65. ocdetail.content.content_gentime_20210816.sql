CREATE TABLE ocdetail.content_gentime_20210816
        PARTITION OF ocdetail.content
        FOR VALUES FROM ('2021-08-15 00:00:00') TO ('2021-08-16 00:00:00');


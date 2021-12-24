CREATE TABLE ocdetail.content_gentime_20211002
        PARTITION OF ocdetail.content
        FOR VALUES FROM ('2021-10-01 00:00:00') TO ('2021-10-02 00:00:00');


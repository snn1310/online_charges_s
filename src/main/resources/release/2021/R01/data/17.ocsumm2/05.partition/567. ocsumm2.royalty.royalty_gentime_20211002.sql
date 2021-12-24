CREATE TABLE ocsumm2.royalty_gentime_20211002
        PARTITION OF ocsumm2.royalty
        FOR VALUES FROM ('2021-10-01 00:00:00') TO ('2021-10-02 00:00:00');


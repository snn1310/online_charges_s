CREATE TABLE ocsumm1.royalty_gentime_20210818
        PARTITION OF ocsumm1.royalty
        FOR VALUES FROM ('2021-08-17 00:00:00') TO ('2021-08-18 00:00:00');


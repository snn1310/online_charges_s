CREATE TABLE ocsumm1.royalty_gentime_20210819
        PARTITION OF ocsumm1.royalty
        FOR VALUES FROM ('2021-08-18 00:00:00') TO ('2021-08-19 00:00:00');


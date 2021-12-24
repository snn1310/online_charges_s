CREATE TABLE ocsumm2.royalty_gentime_20211017
        PARTITION OF ocsumm2.royalty
        FOR VALUES FROM ('2021-10-16 00:00:00') TO ('2021-10-17 00:00:00');


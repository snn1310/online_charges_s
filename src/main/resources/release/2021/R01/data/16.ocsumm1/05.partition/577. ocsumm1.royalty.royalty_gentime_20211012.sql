CREATE TABLE ocsumm1.royalty_gentime_20211012
        PARTITION OF ocsumm1.royalty
        FOR VALUES FROM ('2021-10-11 00:00:00') TO ('2021-10-12 00:00:00');


CREATE TABLE ocsumm2.royalty_gentime_20211004
        PARTITION OF ocsumm2.royalty
        FOR VALUES FROM ('2021-10-03 00:00:00') TO ('2021-10-04 00:00:00');


CREATE TABLE ocsumm2.royalty_gentime_20210923
        PARTITION OF ocsumm2.royalty
        FOR VALUES FROM ('2021-09-22 00:00:00') TO ('2021-09-23 00:00:00');


CREATE TABLE ocsumm2.royalty_usage_gentime_20211008
        PARTITION OF ocsumm2.royalty_usage
        FOR VALUES FROM ('2021-10-07 00:00:00') TO ('2021-10-08 00:00:00');


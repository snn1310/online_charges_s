CREATE TABLE ocsumm2.royalty_usage_gentime_20211011
        PARTITION OF ocsumm2.royalty_usage
        FOR VALUES FROM ('2021-10-10 00:00:00') TO ('2021-10-11 00:00:00');


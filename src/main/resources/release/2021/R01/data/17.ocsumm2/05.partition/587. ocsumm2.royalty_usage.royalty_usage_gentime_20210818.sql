CREATE TABLE ocsumm2.royalty_usage_gentime_20210818
        PARTITION OF ocsumm2.royalty_usage
        FOR VALUES FROM ('2021-08-17 00:00:00') TO ('2021-08-18 00:00:00');


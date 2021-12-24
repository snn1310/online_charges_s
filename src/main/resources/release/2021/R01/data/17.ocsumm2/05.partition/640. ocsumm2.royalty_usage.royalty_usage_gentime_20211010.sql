CREATE TABLE ocsumm2.royalty_usage_gentime_20211010
        PARTITION OF ocsumm2.royalty_usage
        FOR VALUES FROM ('2021-10-09 00:00:00') TO ('2021-10-10 00:00:00');


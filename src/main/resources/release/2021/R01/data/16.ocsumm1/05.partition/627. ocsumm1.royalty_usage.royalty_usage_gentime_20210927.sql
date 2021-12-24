CREATE TABLE ocsumm1.royalty_usage_gentime_20210927
        PARTITION OF ocsumm1.royalty_usage
        FOR VALUES FROM ('2021-09-26 00:00:00') TO ('2021-09-27 00:00:00');


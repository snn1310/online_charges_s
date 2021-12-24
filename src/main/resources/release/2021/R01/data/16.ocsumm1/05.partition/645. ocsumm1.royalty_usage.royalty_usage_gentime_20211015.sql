CREATE TABLE ocsumm1.royalty_usage_gentime_20211015
        PARTITION OF ocsumm1.royalty_usage
        FOR VALUES FROM ('2021-10-14 00:00:00') TO ('2021-10-15 00:00:00');


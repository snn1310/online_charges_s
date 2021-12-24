CREATE TABLE ocsumm1.royalty_usage_gentime_20210904
        PARTITION OF ocsumm1.royalty_usage
        FOR VALUES FROM ('2021-09-03 00:00:00') TO ('2021-09-04 00:00:00');


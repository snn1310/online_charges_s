CREATE TABLE ocsumm2.usage_gentime_20210918
        PARTITION OF ocsumm2.usage
        FOR VALUES FROM ('2021-09-17 00:00:00') TO ('2021-09-18 00:00:00');


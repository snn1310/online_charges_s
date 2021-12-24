CREATE TABLE ocsumm1.usage_gentime_20210926
        PARTITION OF ocsumm1.usage
        FOR VALUES FROM ('2021-09-25 00:00:00') TO ('2021-09-26 00:00:00');


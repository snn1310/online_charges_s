CREATE TABLE ocsumm1.usage_gentime_20210825
        PARTITION OF ocsumm1.usage
        FOR VALUES FROM ('2021-08-24 00:00:00') TO ('2021-08-25 00:00:00');


CREATE TABLE ocsumm2.usage_gentime_20210823
        PARTITION OF ocsumm2.usage
        FOR VALUES FROM ('2021-08-22 00:00:00') TO ('2021-08-23 00:00:00');


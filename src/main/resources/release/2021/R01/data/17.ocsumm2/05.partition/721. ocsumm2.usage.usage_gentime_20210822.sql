CREATE TABLE ocsumm2.usage_gentime_20210822
        PARTITION OF ocsumm2.usage
        FOR VALUES FROM ('2021-08-21 00:00:00') TO ('2021-08-22 00:00:00');


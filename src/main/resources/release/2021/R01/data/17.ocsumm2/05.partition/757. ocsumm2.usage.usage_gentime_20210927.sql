CREATE TABLE ocsumm2.usage_gentime_20210927
        PARTITION OF ocsumm2.usage
        FOR VALUES FROM ('2021-09-26 00:00:00') TO ('2021-09-27 00:00:00');


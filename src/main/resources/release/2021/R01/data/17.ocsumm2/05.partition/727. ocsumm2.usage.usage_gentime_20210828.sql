CREATE TABLE ocsumm2.usage_gentime_20210828
        PARTITION OF ocsumm2.usage
        FOR VALUES FROM ('2021-08-27 00:00:00') TO ('2021-08-28 00:00:00');

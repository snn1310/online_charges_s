CREATE TABLE ocsumm1.usage_gentime_20211014
        PARTITION OF ocsumm1.usage
        FOR VALUES FROM ('2021-10-13 00:00:00') TO ('2021-10-14 00:00:00');


CREATE TABLE ocsumm1.gateway_gentime_20211017
        PARTITION OF ocsumm1.gateway
        FOR VALUES FROM ('2021-10-16 00:00:00') TO ('2021-10-17 00:00:00');


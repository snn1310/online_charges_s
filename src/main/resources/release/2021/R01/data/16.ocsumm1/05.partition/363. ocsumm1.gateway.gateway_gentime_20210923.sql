CREATE TABLE ocsumm1.gateway_gentime_20210923
        PARTITION OF ocsumm1.gateway
        FOR VALUES FROM ('2021-09-22 00:00:00') TO ('2021-09-23 00:00:00');


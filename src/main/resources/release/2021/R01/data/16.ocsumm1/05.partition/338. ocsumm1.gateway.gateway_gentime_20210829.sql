CREATE TABLE ocsumm1.gateway_gentime_20210829
        PARTITION OF ocsumm1.gateway
        FOR VALUES FROM ('2021-08-28 00:00:00') TO ('2021-08-29 00:00:00');

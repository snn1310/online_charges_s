CREATE TABLE ocsumm1.gateway_gentime_20210904
        PARTITION OF ocsumm1.gateway
        FOR VALUES FROM ('2021-09-03 00:00:00') TO ('2021-09-04 00:00:00');


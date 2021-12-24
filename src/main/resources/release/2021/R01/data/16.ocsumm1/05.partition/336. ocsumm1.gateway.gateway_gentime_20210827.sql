CREATE TABLE ocsumm1.gateway_gentime_20210827
        PARTITION OF ocsumm1.gateway
        FOR VALUES FROM ('2021-08-26 00:00:00') TO ('2021-08-27 00:00:00');


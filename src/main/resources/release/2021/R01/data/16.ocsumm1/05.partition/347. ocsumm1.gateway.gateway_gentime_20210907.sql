CREATE TABLE ocsumm1.gateway_gentime_20210907
        PARTITION OF ocsumm1.gateway
        FOR VALUES FROM ('2021-09-06 00:00:00') TO ('2021-09-07 00:00:00');


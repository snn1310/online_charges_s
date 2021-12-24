CREATE TABLE ocsumm2.gateway_gentime_20210905
        PARTITION OF ocsumm2.gateway
        FOR VALUES FROM ('2021-09-04 00:00:00') TO ('2021-09-05 00:00:00');


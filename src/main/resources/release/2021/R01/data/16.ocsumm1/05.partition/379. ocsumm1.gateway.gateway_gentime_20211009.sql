CREATE TABLE ocsumm1.gateway_gentime_20211009
        PARTITION OF ocsumm1.gateway
        FOR VALUES FROM ('2021-10-08 00:00:00') TO ('2021-10-09 00:00:00');


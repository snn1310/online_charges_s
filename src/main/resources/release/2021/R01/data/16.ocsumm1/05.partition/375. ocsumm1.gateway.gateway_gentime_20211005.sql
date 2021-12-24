CREATE TABLE ocsumm1.gateway_gentime_20211005
        PARTITION OF ocsumm1.gateway
        FOR VALUES FROM ('2021-10-04 00:00:00') TO ('2021-10-05 00:00:00');


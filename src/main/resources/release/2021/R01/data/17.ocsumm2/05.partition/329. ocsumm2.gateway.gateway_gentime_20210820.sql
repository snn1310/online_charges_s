CREATE TABLE ocsumm2.gateway_gentime_20210820
        PARTITION OF ocsumm2.gateway
        FOR VALUES FROM ('2021-08-19 00:00:00') TO ('2021-08-20 00:00:00');


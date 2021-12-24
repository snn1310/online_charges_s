CREATE TABLE ocsumm2.gateway_gentime_20210816
        PARTITION OF ocsumm2.gateway
        FOR VALUES FROM (MINVALUE) TO ('2021-08-16 00:00:00');


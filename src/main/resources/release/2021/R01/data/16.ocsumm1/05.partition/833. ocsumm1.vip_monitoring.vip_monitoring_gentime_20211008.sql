CREATE TABLE ocsumm1.vip_monitoring_gentime_20211008
        PARTITION OF ocsumm1.vip_monitoring
        FOR VALUES FROM ('2021-10-07 00:00:00') TO ('2021-10-08 00:00:00');


CREATE TABLE ocsumm2.vip_monitoring_gentime_20210823
        PARTITION OF ocsumm2.vip_monitoring
        FOR VALUES FROM ('2021-08-22 00:00:00') TO ('2021-08-23 00:00:00');


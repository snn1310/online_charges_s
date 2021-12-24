CREATE TABLE ocsumm2.vip_monitoring_gentime_20210821
        PARTITION OF ocsumm2.vip_monitoring
        FOR VALUES FROM ('2021-08-20 00:00:00') TO ('2021-08-21 00:00:00');


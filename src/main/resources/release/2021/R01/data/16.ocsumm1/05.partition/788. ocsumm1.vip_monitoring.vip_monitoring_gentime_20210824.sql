CREATE TABLE ocsumm1.vip_monitoring_gentime_20210824
        PARTITION OF ocsumm1.vip_monitoring
        FOR VALUES FROM ('2021-08-23 00:00:00') TO ('2021-08-24 00:00:00');


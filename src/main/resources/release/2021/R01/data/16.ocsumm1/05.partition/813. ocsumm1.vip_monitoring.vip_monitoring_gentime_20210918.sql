CREATE TABLE ocsumm1.vip_monitoring_gentime_20210918
        PARTITION OF ocsumm1.vip_monitoring
        FOR VALUES FROM ('2021-09-17 00:00:00') TO ('2021-09-18 00:00:00');


CREATE TABLE ocsumm2.vip_monitoring_gentime_20210904
        PARTITION OF ocsumm2.vip_monitoring
        FOR VALUES FROM ('2021-09-03 00:00:00') TO ('2021-09-04 00:00:00');

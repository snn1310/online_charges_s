CREATE TABLE ocsumm2.vip_monitoring_gentime_20210911
        PARTITION OF ocsumm2.vip_monitoring
        FOR VALUES FROM ('2021-09-10 00:00:00') TO ('2021-09-11 00:00:00');


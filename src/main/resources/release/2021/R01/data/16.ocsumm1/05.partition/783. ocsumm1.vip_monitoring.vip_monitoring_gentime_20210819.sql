CREATE TABLE ocsumm1.vip_monitoring_gentime_20210819
        PARTITION OF ocsumm1.vip_monitoring
        FOR VALUES FROM ('2021-08-18 00:00:00') TO ('2021-08-19 00:00:00');

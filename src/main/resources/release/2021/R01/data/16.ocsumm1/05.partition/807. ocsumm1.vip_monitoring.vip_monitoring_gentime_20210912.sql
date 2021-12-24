CREATE TABLE ocsumm1.vip_monitoring_gentime_20210912
        PARTITION OF ocsumm1.vip_monitoring
        FOR VALUES FROM ('2021-09-11 00:00:00') TO ('2021-09-12 00:00:00');


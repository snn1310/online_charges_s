CREATE TABLE ocsumm2.vip_monitoring_gentime_20210928
        PARTITION OF ocsumm2.vip_monitoring
        FOR VALUES FROM ('2021-09-27 00:00:00') TO ('2021-09-28 00:00:00');


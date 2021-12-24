CREATE TABLE ocsumm2.vip_monitoring_gentime_20211016
        PARTITION OF ocsumm2.vip_monitoring
        FOR VALUES FROM ('2021-10-15 00:00:00') TO ('2021-10-16 00:00:00');


CREATE TABLE ocsumm2.vip_monitoring_gentime_20211002
        PARTITION OF ocsumm2.vip_monitoring
        FOR VALUES FROM ('2021-10-01 00:00:00') TO ('2021-10-02 00:00:00');

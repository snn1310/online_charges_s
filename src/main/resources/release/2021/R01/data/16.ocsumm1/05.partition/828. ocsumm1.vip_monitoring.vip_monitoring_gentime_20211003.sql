CREATE TABLE ocsumm1.vip_monitoring_gentime_20211003
        PARTITION OF ocsumm1.vip_monitoring
        FOR VALUES FROM ('2021-10-02 00:00:00') TO ('2021-10-03 00:00:00');


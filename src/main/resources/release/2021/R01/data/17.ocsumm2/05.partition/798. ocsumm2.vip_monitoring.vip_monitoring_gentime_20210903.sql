CREATE TABLE ocsumm2.vip_monitoring_gentime_20210903
        PARTITION OF ocsumm2.vip_monitoring
        FOR VALUES FROM ('2021-09-02 00:00:00') TO ('2021-09-03 00:00:00');


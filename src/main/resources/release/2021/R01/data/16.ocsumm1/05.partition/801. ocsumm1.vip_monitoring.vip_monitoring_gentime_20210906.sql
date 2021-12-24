CREATE TABLE ocsumm1.vip_monitoring_gentime_20210906
        PARTITION OF ocsumm1.vip_monitoring
        FOR VALUES FROM ('2021-09-05 00:00:00') TO ('2021-09-06 00:00:00');


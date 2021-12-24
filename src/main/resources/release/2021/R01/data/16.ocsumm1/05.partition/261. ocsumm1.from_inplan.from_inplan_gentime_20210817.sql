CREATE TABLE ocsumm1.from_inplan_gentime_20210817
        PARTITION OF ocsumm1.from_inplan
        FOR VALUES FROM ('2021-08-16 00:00:00') TO ('2021-08-17 00:00:00');


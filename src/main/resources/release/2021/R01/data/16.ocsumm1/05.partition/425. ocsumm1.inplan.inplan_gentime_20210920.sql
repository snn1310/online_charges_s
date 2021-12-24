CREATE TABLE ocsumm1.inplan_gentime_20210920
        PARTITION OF ocsumm1.inplan
        FOR VALUES FROM ('2021-09-19 00:00:00') TO ('2021-09-20 00:00:00');


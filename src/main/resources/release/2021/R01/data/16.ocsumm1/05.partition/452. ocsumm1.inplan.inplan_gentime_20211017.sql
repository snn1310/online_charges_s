CREATE TABLE ocsumm1.inplan_gentime_20211017
        PARTITION OF ocsumm1.inplan
        FOR VALUES FROM ('2021-10-16 00:00:00') TO ('2021-10-17 00:00:00');


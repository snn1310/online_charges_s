CREATE TABLE ocsumm1.inplan_gentime_20211004
        PARTITION OF ocsumm1.inplan
        FOR VALUES FROM ('2021-10-03 00:00:00') TO ('2021-10-04 00:00:00');


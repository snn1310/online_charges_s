CREATE TABLE ocsumm2.from_inplan_gentime_20210921
        PARTITION OF ocsumm2.from_inplan
        FOR VALUES FROM ('2021-09-20 00:00:00') TO ('2021-09-21 00:00:00');


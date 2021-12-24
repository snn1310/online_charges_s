CREATE TABLE ocsumm2.inplan_gentime_20211008
        PARTITION OF ocsumm2.inplan
        FOR VALUES FROM ('2021-10-07 00:00:00') TO ('2021-10-08 00:00:00');


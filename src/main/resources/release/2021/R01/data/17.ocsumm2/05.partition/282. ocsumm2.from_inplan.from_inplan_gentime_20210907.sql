CREATE TABLE ocsumm2.from_inplan_gentime_20210907
        PARTITION OF ocsumm2.from_inplan
        FOR VALUES FROM ('2021-09-06 00:00:00') TO ('2021-09-07 00:00:00');


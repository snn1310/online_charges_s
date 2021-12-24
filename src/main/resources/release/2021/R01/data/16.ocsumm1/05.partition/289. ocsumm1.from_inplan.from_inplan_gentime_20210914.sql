CREATE TABLE ocsumm1.from_inplan_gentime_20210914
        PARTITION OF ocsumm1.from_inplan
        FOR VALUES FROM ('2021-09-13 00:00:00') TO ('2021-09-14 00:00:00');


CREATE TABLE ocsumm2.inplan_gentime_20210929
        PARTITION OF ocsumm2.inplan
        FOR VALUES FROM ('2021-09-28 00:00:00') TO ('2021-09-29 00:00:00');

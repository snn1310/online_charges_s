CREATE TABLE ocsumm1.inplan_gentime_20210916
        PARTITION OF ocsumm1.inplan
        FOR VALUES FROM ('2021-09-15 00:00:00') TO ('2021-09-16 00:00:00');


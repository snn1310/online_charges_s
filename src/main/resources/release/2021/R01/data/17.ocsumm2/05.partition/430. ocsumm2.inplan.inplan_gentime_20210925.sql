CREATE TABLE ocsumm2.inplan_gentime_20210925
        PARTITION OF ocsumm2.inplan
        FOR VALUES FROM ('2021-09-24 00:00:00') TO ('2021-09-25 00:00:00');


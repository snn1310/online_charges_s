CREATE TABLE ocsumm1.inplan_gentime_20210822
        PARTITION OF ocsumm1.inplan
        FOR VALUES FROM ('2021-08-21 00:00:00') TO ('2021-08-22 00:00:00');

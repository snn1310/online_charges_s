CREATE TABLE ocsumm2.from_inplan_gentime_20210816
        PARTITION OF ocsumm2.from_inplan
        FOR VALUES FROM (MINVALUE) TO ('2021-08-16 00:00:00');


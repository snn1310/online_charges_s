CREATE TABLE ocsumm2.from_inplan_gentime_20211014
        PARTITION OF ocsumm2.from_inplan
        FOR VALUES FROM ('2021-10-13 00:00:00') TO ('2021-10-14 00:00:00');


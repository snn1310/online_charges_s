CREATE TABLE ocsumm1.inplan_gentime_20211012
        PARTITION OF ocsumm1.inplan
        FOR VALUES FROM ('2021-10-11 00:00:00') TO ('2021-10-12 00:00:00');


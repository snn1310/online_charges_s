CREATE TABLE ocsumm2.from_inplan_gentime_20210820
        PARTITION OF ocsumm2.from_inplan
        FOR VALUES FROM ('2021-08-19 00:00:00') TO ('2021-08-20 00:00:00');


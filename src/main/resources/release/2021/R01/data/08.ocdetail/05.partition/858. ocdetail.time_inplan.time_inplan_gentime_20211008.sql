CREATE TABLE ocdetail.time_inplan_gentime_20211008
        PARTITION OF ocdetail.time_inplan
        FOR VALUES FROM ('2021-10-07 00:00:00') TO ('2021-10-08 00:00:00');


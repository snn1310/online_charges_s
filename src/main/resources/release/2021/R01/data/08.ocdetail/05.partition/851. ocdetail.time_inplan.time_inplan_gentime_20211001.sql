CREATE TABLE ocdetail.time_inplan_gentime_20211001
        PARTITION OF ocdetail.time_inplan
        FOR VALUES FROM ('2021-09-30 00:00:00') TO ('2021-10-01 00:00:00');


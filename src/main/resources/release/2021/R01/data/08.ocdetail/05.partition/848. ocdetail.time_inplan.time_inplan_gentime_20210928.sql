CREATE TABLE ocdetail.time_inplan_gentime_20210928
        PARTITION OF ocdetail.time_inplan
        FOR VALUES FROM ('2021-09-27 00:00:00') TO ('2021-09-28 00:00:00');


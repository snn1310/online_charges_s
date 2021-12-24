CREATE TABLE ocdetail.time_inplan_gentime_20210918
        PARTITION OF ocdetail.time_inplan
        FOR VALUES FROM ('2021-09-17 00:00:00') TO ('2021-09-18 00:00:00');


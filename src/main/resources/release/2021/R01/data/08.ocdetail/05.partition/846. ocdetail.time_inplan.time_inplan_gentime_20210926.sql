CREATE TABLE ocdetail.time_inplan_gentime_20210926
        PARTITION OF ocdetail.time_inplan
        FOR VALUES FROM ('2021-09-25 00:00:00') TO ('2021-09-26 00:00:00');


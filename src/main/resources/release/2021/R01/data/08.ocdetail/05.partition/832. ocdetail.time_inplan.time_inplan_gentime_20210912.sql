CREATE TABLE ocdetail.time_inplan_gentime_20210912
        PARTITION OF ocdetail.time_inplan
        FOR VALUES FROM ('2021-09-11 00:00:00') TO ('2021-09-12 00:00:00');


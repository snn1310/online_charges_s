CREATE TABLE ocdetail.tran_inplan_gentime_20210914
        PARTITION OF ocdetail.tran_inplan
        FOR VALUES FROM ('2021-09-13 00:00:00') TO ('2021-09-14 00:00:00');


CREATE TABLE ocdetail.tran_inplan_gentime_20210926
        PARTITION OF ocdetail.tran_inplan
        FOR VALUES FROM ('2021-09-25 00:00:00') TO ('2021-09-26 00:00:00');


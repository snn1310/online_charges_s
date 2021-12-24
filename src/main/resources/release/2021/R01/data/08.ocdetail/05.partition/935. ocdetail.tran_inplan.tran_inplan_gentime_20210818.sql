CREATE TABLE ocdetail.tran_inplan_gentime_20210818
        PARTITION OF ocdetail.tran_inplan
        FOR VALUES FROM ('2021-08-17 00:00:00') TO ('2021-08-18 00:00:00');


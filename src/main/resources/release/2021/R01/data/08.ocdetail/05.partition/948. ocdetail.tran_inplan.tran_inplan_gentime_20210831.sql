CREATE TABLE ocdetail.tran_inplan_gentime_20210831
        PARTITION OF ocdetail.tran_inplan
        FOR VALUES FROM ('2021-08-30 00:00:00') TO ('2021-08-31 00:00:00');


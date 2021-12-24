CREATE TABLE ocdetail.tran_inplan_gentime_20210905
        PARTITION OF ocdetail.tran_inplan
        FOR VALUES FROM ('2021-09-04 00:00:00') TO ('2021-09-05 00:00:00');


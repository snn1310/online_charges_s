CREATE TABLE ocdetail.roy_tran_usg_detail_gentime_20210905
        PARTITION OF ocdetail.roy_tran_usg_detail
        FOR VALUES FROM ('2021-09-04 00:00:00') TO ('2021-09-05 00:00:00');


CREATE TABLE ocdetail.roy_tran_usg_detail_gentime_20210922
        PARTITION OF ocdetail.roy_tran_usg_detail
        FOR VALUES FROM ('2021-09-21 00:00:00') TO ('2021-09-22 00:00:00');


CREATE TABLE ccdetail2.roy_tran_usg_detail_gentime_20211001
        PARTITION OF ccdetail2.roy_tran_usg_detail
        FOR VALUES FROM ('2021-09-30 00:00:00') TO ('2021-10-01 00:00:00');


CREATE TABLE ccdetail2.roy_tran_usg_detail_gentime_20211008
        PARTITION OF ccdetail2.roy_tran_usg_detail
        FOR VALUES FROM ('2021-10-07 00:00:00') TO ('2021-10-08 00:00:00');


CREATE TABLE ccdetail2.roy_tran_usg_detail_gentime_20211011
        PARTITION OF ccdetail2.roy_tran_usg_detail
        FOR VALUES FROM ('2021-10-10 00:00:00') TO ('2021-10-11 00:00:00');


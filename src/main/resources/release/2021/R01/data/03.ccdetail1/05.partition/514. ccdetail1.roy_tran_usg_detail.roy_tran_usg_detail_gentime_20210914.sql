CREATE TABLE ccdetail1.roy_tran_usg_detail_gentime_20210914
        PARTITION OF ccdetail1.roy_tran_usg_detail
        FOR VALUES FROM ('2021-09-13 00:00:00') TO ('2021-09-14 00:00:00');


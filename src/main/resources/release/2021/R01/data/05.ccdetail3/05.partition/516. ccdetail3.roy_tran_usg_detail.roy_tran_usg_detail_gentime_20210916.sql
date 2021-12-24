CREATE TABLE ccdetail3.roy_tran_usg_detail_gentime_20210916
        PARTITION OF ccdetail3.roy_tran_usg_detail
        FOR VALUES FROM ('2021-09-15 00:00:00') TO ('2021-09-16 00:00:00');


CREATE TABLE ccdetail1.roy_tran_usg_detail_gentime_20210912
        PARTITION OF ccdetail1.roy_tran_usg_detail
        FOR VALUES FROM ('2021-09-11 00:00:00') TO ('2021-09-12 00:00:00');


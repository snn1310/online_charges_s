CREATE TABLE ocdetail.roy_tran_usg_detail_gentime_20210817
        PARTITION OF ocdetail.roy_tran_usg_detail
        FOR VALUES FROM ('2021-08-16 00:00:00') TO ('2021-08-17 00:00:00');


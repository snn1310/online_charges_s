CREATE TABLE ocdetail.roy_tran_usg_detail_gentime_20210831
        PARTITION OF ocdetail.roy_tran_usg_detail
        FOR VALUES FROM ('2021-08-30 00:00:00') TO ('2021-08-31 00:00:00');


CREATE TABLE ocdetail.roy_tran_usg_detail_gentime_20211016
        PARTITION OF ocdetail.roy_tran_usg_detail
        FOR VALUES FROM ('2021-10-15 00:00:00') TO ('2021-10-16 00:00:00');


CREATE TABLE ocdetail.roy_tran_usg_detail_gentime_20210827
        PARTITION OF ocdetail.roy_tran_usg_detail
        FOR VALUES FROM ('2021-08-26 00:00:00') TO ('2021-08-27 00:00:00');


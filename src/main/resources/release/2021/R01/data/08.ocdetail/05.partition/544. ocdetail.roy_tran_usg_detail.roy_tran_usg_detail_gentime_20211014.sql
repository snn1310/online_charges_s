CREATE TABLE ocdetail.roy_tran_usg_detail_gentime_20211014
        PARTITION OF ocdetail.roy_tran_usg_detail
        FOR VALUES FROM ('2021-10-13 00:00:00') TO ('2021-10-14 00:00:00');


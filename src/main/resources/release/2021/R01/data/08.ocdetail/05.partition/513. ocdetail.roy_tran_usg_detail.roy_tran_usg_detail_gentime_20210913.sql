CREATE TABLE ocdetail.roy_tran_usg_detail_gentime_20210913
        PARTITION OF ocdetail.roy_tran_usg_detail
        FOR VALUES FROM ('2021-09-12 00:00:00') TO ('2021-09-13 00:00:00');


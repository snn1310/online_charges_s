CREATE TABLE ccdetail4.roy_tran_usg_detail_gentime_20211010
        PARTITION OF ccdetail4.roy_tran_usg_detail
        FOR VALUES FROM ('2021-10-09 00:00:00') TO ('2021-10-10 00:00:00');


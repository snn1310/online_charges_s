CREATE TABLE ccdetail4.tran_royalty_gentime_20210818
        PARTITION OF ccdetail4.tran_royalty
        FOR VALUES FROM ('2021-08-17 00:00:00') TO ('2021-08-18 00:00:00');


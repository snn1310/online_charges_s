CREATE TABLE ccdetail4.tran_royalty_gentime_20211010
        PARTITION OF ccdetail4.tran_royalty
        FOR VALUES FROM ('2021-10-09 00:00:00') TO ('2021-10-10 00:00:00');


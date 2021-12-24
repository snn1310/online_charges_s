CREATE TABLE ccdetail4.tran_royalty_gentime_20211004
        PARTITION OF ccdetail4.tran_royalty
        FOR VALUES FROM ('2021-10-03 00:00:00') TO ('2021-10-04 00:00:00');


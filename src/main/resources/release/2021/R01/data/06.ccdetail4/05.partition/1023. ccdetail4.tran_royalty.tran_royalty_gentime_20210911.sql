CREATE TABLE ccdetail4.tran_royalty_gentime_20210911
        PARTITION OF ccdetail4.tran_royalty
        FOR VALUES FROM ('2021-09-10 00:00:00') TO ('2021-09-11 00:00:00');


CREATE TABLE ccdetail4.tran_royalty_gentime_20210920
        PARTITION OF ccdetail4.tran_royalty
        FOR VALUES FROM ('2021-09-19 00:00:00') TO ('2021-09-20 00:00:00');


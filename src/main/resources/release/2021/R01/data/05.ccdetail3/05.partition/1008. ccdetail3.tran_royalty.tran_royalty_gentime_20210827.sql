CREATE TABLE ccdetail3.tran_royalty_gentime_20210827
        PARTITION OF ccdetail3.tran_royalty
        FOR VALUES FROM ('2021-08-26 00:00:00') TO ('2021-08-27 00:00:00');


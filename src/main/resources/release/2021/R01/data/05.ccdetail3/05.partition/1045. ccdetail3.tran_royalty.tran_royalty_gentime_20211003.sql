CREATE TABLE ccdetail3.tran_royalty_gentime_20211003
        PARTITION OF ccdetail3.tran_royalty
        FOR VALUES FROM ('2021-10-02 00:00:00') TO ('2021-10-03 00:00:00');


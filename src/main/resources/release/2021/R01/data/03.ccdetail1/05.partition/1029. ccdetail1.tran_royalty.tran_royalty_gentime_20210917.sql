CREATE TABLE ccdetail1.tran_royalty_gentime_20210917
        PARTITION OF ccdetail1.tran_royalty
        FOR VALUES FROM ('2021-09-16 00:00:00') TO ('2021-09-17 00:00:00');


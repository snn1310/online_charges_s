CREATE TABLE ccdetail1.tran_royalty_gentime_20210816
        PARTITION OF ccdetail1.tran_royalty
        FOR VALUES FROM ('2021-08-15 00:00:00') TO ('2021-08-16 00:00:00');


CREATE TABLE ccdetail3.tran_royalty_gentime_20210919
        PARTITION OF ccdetail3.tran_royalty
        FOR VALUES FROM ('2021-09-18 00:00:00') TO ('2021-09-19 00:00:00');


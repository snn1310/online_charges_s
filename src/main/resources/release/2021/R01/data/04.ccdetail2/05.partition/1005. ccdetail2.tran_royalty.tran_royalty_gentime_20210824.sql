CREATE TABLE ccdetail2.tran_royalty_gentime_20210824
        PARTITION OF ccdetail2.tran_royalty
        FOR VALUES FROM ('2021-08-23 00:00:00') TO ('2021-08-24 00:00:00');


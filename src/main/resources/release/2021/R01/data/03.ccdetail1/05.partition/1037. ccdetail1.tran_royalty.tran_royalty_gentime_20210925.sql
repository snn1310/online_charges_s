CREATE TABLE ccdetail1.tran_royalty_gentime_20210925
        PARTITION OF ccdetail1.tran_royalty
        FOR VALUES FROM ('2021-09-24 00:00:00') TO ('2021-09-25 00:00:00');


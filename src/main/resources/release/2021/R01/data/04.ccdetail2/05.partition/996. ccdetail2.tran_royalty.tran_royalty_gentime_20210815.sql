CREATE TABLE ccdetail2.tran_royalty_gentime_20210815
        PARTITION OF ccdetail2.tran_royalty
        FOR VALUES FROM (MINVALUE) TO ('2021-08-15 00:00:00');


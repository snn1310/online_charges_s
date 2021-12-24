CREATE TABLE ccdetail2.royalty_tran_usage_gentime_20211008
        PARTITION OF ccdetail2.royalty_tran_usage
        FOR VALUES FROM ('2021-10-07 00:00:00') TO ('2021-10-08 00:00:00');


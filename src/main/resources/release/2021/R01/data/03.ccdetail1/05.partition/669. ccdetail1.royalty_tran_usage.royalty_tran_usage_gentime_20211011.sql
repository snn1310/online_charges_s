CREATE TABLE ccdetail1.royalty_tran_usage_gentime_20211011
        PARTITION OF ccdetail1.royalty_tran_usage
        FOR VALUES FROM ('2021-10-10 00:00:00') TO ('2021-10-11 00:00:00');


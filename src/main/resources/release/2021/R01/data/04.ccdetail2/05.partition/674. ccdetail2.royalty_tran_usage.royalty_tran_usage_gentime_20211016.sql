CREATE TABLE ccdetail2.royalty_tran_usage_gentime_20211016
        PARTITION OF ccdetail2.royalty_tran_usage
        FOR VALUES FROM ('2021-10-15 00:00:00') TO ('2021-10-16 00:00:00');


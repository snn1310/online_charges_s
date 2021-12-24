CREATE TABLE ccdetail3.royalty_tran_usage_gentime_20211012
        PARTITION OF ccdetail3.royalty_tran_usage
        FOR VALUES FROM ('2021-10-11 00:00:00') TO ('2021-10-12 00:00:00');


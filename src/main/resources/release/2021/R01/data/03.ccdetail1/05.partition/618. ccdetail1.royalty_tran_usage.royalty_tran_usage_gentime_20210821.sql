CREATE TABLE ccdetail1.royalty_tran_usage_gentime_20210821
        PARTITION OF ccdetail1.royalty_tran_usage
        FOR VALUES FROM ('2021-08-20 00:00:00') TO ('2021-08-21 00:00:00');


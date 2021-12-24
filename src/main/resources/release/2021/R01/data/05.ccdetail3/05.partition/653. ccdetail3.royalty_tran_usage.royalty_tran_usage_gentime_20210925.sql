CREATE TABLE ccdetail3.royalty_tran_usage_gentime_20210925
        PARTITION OF ccdetail3.royalty_tran_usage
        FOR VALUES FROM ('2021-09-24 00:00:00') TO ('2021-09-25 00:00:00');


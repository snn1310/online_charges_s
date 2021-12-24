CREATE TABLE ccdetail4.royalty_tran_usage_gentime_20210829
        PARTITION OF ccdetail4.royalty_tran_usage
        FOR VALUES FROM ('2021-08-28 00:00:00') TO ('2021-08-29 00:00:00');


CREATE TABLE ccdetail4.royalty_tran_usage_gentime_20210824
        PARTITION OF ccdetail4.royalty_tran_usage
        FOR VALUES FROM ('2021-08-23 00:00:00') TO ('2021-08-24 00:00:00');


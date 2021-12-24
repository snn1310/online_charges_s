CREATE TABLE ccdetail4.royalty_tran_usage_gentime_20211002
        PARTITION OF ccdetail4.royalty_tran_usage
        FOR VALUES FROM ('2021-10-01 00:00:00') TO ('2021-10-02 00:00:00');


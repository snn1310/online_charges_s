CREATE TABLE ccdetail4.discount_detail_gentime_20210903
        PARTITION OF ccdetail4.discount_detail
        FOR VALUES FROM ('2021-09-02 00:00:00') TO ('2021-09-03 00:00:00');


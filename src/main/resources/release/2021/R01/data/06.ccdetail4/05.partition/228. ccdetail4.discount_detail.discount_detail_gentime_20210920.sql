CREATE TABLE ccdetail4.discount_detail_gentime_20210920
        PARTITION OF ccdetail4.discount_detail
        FOR VALUES FROM ('2021-09-19 00:00:00') TO ('2021-09-20 00:00:00');


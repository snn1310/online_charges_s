CREATE TABLE ccdetail4.discount_detail_gentime_20211008
        PARTITION OF ccdetail4.discount_detail
        FOR VALUES FROM ('2021-10-07 00:00:00') TO ('2021-10-08 00:00:00');


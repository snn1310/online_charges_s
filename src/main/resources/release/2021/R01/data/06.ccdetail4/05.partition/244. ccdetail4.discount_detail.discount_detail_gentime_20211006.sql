CREATE TABLE ccdetail4.discount_detail_gentime_20211006
        PARTITION OF ccdetail4.discount_detail
        FOR VALUES FROM ('2021-10-05 00:00:00') TO ('2021-10-06 00:00:00');


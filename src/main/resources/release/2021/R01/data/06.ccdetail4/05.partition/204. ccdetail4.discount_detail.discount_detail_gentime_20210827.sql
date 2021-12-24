CREATE TABLE ccdetail4.discount_detail_gentime_20210827
        PARTITION OF ccdetail4.discount_detail
        FOR VALUES FROM ('2021-08-26 00:00:00') TO ('2021-08-27 00:00:00');


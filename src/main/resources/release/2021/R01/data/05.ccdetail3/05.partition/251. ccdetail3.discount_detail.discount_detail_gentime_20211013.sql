CREATE TABLE ccdetail3.discount_detail_gentime_20211013
        PARTITION OF ccdetail3.discount_detail
        FOR VALUES FROM ('2021-10-12 00:00:00') TO ('2021-10-13 00:00:00');


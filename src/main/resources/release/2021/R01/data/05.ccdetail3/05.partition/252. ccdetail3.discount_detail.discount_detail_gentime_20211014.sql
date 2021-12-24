CREATE TABLE ccdetail3.discount_detail_gentime_20211014
        PARTITION OF ccdetail3.discount_detail
        FOR VALUES FROM ('2021-10-13 00:00:00') TO ('2021-10-14 00:00:00');


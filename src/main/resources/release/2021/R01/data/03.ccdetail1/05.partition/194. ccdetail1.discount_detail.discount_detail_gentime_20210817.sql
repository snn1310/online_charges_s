CREATE TABLE ccdetail1.discount_detail_gentime_20210817
        PARTITION OF ccdetail1.discount_detail
        FOR VALUES FROM ('2021-08-16 00:00:00') TO ('2021-08-17 00:00:00');


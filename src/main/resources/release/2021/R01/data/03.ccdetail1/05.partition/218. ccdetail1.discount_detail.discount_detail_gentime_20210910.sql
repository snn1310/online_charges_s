CREATE TABLE ccdetail1.discount_detail_gentime_20210910
        PARTITION OF ccdetail1.discount_detail
        FOR VALUES FROM ('2021-09-09 00:00:00') TO ('2021-09-10 00:00:00');


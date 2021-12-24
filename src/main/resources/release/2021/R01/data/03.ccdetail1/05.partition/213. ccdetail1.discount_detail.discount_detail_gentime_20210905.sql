CREATE TABLE ccdetail1.discount_detail_gentime_20210905
        PARTITION OF ccdetail1.discount_detail
        FOR VALUES FROM ('2021-09-04 00:00:00') TO ('2021-09-05 00:00:00');


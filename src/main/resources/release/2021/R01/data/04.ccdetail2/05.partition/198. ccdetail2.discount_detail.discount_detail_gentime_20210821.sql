CREATE TABLE ccdetail2.discount_detail_gentime_20210821
        PARTITION OF ccdetail2.discount_detail
        FOR VALUES FROM ('2021-08-20 00:00:00') TO ('2021-08-21 00:00:00');

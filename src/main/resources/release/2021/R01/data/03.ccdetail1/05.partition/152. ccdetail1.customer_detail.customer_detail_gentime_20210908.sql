CREATE TABLE ccdetail1.customer_detail_gentime_20210908
        PARTITION OF ccdetail1.customer_detail
        FOR VALUES FROM ('2021-09-07 00:00:00') TO ('2021-09-08 00:00:00');

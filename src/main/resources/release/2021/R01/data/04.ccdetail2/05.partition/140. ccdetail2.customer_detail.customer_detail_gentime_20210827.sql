CREATE TABLE ccdetail2.customer_detail_gentime_20210827
        PARTITION OF ccdetail2.customer_detail
        FOR VALUES FROM ('2021-08-26 00:00:00') TO ('2021-08-27 00:00:00');


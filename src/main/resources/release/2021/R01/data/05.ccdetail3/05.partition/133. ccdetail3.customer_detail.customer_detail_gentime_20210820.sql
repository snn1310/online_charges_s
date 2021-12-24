CREATE TABLE ccdetail3.customer_detail_gentime_20210820
        PARTITION OF ccdetail3.customer_detail
        FOR VALUES FROM ('2021-08-19 00:00:00') TO ('2021-08-20 00:00:00');


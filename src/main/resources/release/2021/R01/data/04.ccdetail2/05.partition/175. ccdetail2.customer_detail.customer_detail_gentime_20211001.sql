CREATE TABLE ccdetail2.customer_detail_gentime_20211001
        PARTITION OF ccdetail2.customer_detail
        FOR VALUES FROM ('2021-09-30 00:00:00') TO ('2021-10-01 00:00:00');


CREATE TABLE ccdetail2.customer_detail_gentime_20210906
        PARTITION OF ccdetail2.customer_detail
        FOR VALUES FROM ('2021-09-05 00:00:00') TO ('2021-09-06 00:00:00');


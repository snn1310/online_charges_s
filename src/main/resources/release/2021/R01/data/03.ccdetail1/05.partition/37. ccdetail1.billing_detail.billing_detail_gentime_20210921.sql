CREATE TABLE ccdetail1.billing_detail_gentime_20210921
        PARTITION OF ccdetail1.billing_detail
        FOR VALUES FROM ('2021-09-20 00:00:00') TO ('2021-09-21 00:00:00');


CREATE TABLE ccdetail3.billing_detail_gentime_20210916
        PARTITION OF ccdetail3.billing_detail
        FOR VALUES FROM ('2021-09-15 00:00:00') TO ('2021-09-16 00:00:00');


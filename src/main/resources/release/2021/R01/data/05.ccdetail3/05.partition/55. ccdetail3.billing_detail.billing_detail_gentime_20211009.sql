CREATE TABLE ccdetail3.billing_detail_gentime_20211009
        PARTITION OF ccdetail3.billing_detail
        FOR VALUES FROM ('2021-10-08 00:00:00') TO ('2021-10-09 00:00:00');

CREATE TABLE ccdetail2.billing_detail_gentime_20210915
        PARTITION OF ccdetail2.billing_detail
        FOR VALUES FROM ('2021-09-14 00:00:00') TO ('2021-09-15 00:00:00');


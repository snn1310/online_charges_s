CREATE TABLE ccdetail1.usg_billing_detail_gentime_20210910
        PARTITION OF ccdetail1.usg_billing_detail
        FOR VALUES FROM ('2021-09-09 00:00:00') TO ('2021-09-10 00:00:00');


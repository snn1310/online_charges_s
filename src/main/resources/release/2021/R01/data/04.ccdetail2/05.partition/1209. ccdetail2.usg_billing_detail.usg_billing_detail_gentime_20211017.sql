CREATE TABLE ccdetail2.usg_billing_detail_gentime_20211017
        PARTITION OF ccdetail2.usg_billing_detail
        FOR VALUES FROM ('2021-10-16 00:00:00') TO ('2021-10-17 00:00:00');


CREATE TABLE ccdetail2.usg_billing_detail_gentime_20211007
        PARTITION OF ccdetail2.usg_billing_detail
        FOR VALUES FROM ('2021-10-06 00:00:00') TO ('2021-10-07 00:00:00');


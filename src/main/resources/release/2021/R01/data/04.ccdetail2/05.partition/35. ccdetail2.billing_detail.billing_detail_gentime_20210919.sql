CREATE TABLE ccdetail2.billing_detail_gentime_20210919
        PARTITION OF ccdetail2.billing_detail
        FOR VALUES FROM ('2021-09-18 00:00:00') TO ('2021-09-19 00:00:00');


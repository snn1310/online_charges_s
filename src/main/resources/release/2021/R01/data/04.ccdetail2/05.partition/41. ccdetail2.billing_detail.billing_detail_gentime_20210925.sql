CREATE TABLE ccdetail2.billing_detail_gentime_20210925
        PARTITION OF ccdetail2.billing_detail
        FOR VALUES FROM ('2021-09-24 00:00:00') TO ('2021-09-25 00:00:00');


CREATE TABLE ccdetail1.billing_detail_gentime_20210912
        PARTITION OF ccdetail1.billing_detail
        FOR VALUES FROM ('2021-09-11 00:00:00') TO ('2021-09-12 00:00:00');


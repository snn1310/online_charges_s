CREATE TABLE ccdetail1.billing_detail_gentime_20211002
        PARTITION OF ccdetail1.billing_detail
        FOR VALUES FROM ('2021-10-01 00:00:00') TO ('2021-10-02 00:00:00');


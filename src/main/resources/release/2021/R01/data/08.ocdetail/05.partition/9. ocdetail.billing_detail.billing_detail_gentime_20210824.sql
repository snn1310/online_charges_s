CREATE TABLE ocdetail.billing_detail_gentime_20210824
        PARTITION OF ocdetail.billing_detail
        FOR VALUES FROM ('2021-08-23 00:00:00') TO ('2021-08-24 00:00:00');


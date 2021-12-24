CREATE TABLE ocdetail.usg_billing_detail_gentime_20210917
        PARTITION OF ocdetail.usg_billing_detail
        FOR VALUES FROM ('2021-09-16 00:00:00') TO ('2021-09-17 00:00:00');


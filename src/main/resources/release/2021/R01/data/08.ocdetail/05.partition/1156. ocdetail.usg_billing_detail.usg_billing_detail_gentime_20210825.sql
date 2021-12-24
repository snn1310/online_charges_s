CREATE TABLE ocdetail.usg_billing_detail_gentime_20210825
        PARTITION OF ocdetail.usg_billing_detail
        FOR VALUES FROM ('2021-08-24 00:00:00') TO ('2021-08-25 00:00:00');


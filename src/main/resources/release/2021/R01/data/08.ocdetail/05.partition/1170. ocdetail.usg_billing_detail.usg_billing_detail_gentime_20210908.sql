CREATE TABLE ocdetail.usg_billing_detail_gentime_20210908
        PARTITION OF ocdetail.usg_billing_detail
        FOR VALUES FROM ('2021-09-07 00:00:00') TO ('2021-09-08 00:00:00');


CREATE TABLE ocdetail.usg_billing_detail_gentime_20210819
        PARTITION OF ocdetail.usg_billing_detail
        FOR VALUES FROM ('2021-08-18 00:00:00') TO ('2021-08-19 00:00:00');


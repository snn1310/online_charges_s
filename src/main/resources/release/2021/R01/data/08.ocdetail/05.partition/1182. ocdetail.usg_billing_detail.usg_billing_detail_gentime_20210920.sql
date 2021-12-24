CREATE TABLE ocdetail.usg_billing_detail_gentime_20210920
        PARTITION OF ocdetail.usg_billing_detail
        FOR VALUES FROM ('2021-09-19 00:00:00') TO ('2021-09-20 00:00:00');


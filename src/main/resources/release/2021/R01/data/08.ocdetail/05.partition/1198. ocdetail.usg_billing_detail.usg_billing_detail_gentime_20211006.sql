CREATE TABLE ocdetail.usg_billing_detail_gentime_20211006
        PARTITION OF ocdetail.usg_billing_detail
        FOR VALUES FROM ('2021-10-05 00:00:00') TO ('2021-10-06 00:00:00');

CREATE TABLE ocdetail.usg_billing_detail_gentime_20211005
        PARTITION OF ocdetail.usg_billing_detail
        FOR VALUES FROM ('2021-10-04 00:00:00') TO ('2021-10-05 00:00:00');


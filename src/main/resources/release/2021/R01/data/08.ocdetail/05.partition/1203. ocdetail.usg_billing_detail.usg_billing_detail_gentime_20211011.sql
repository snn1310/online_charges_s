CREATE TABLE ocdetail.usg_billing_detail_gentime_20211011
        PARTITION OF ocdetail.usg_billing_detail
        FOR VALUES FROM ('2021-10-10 00:00:00') TO ('2021-10-11 00:00:00');


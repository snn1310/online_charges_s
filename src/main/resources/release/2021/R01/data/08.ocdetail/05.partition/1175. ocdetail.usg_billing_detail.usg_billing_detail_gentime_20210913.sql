CREATE TABLE ocdetail.usg_billing_detail_gentime_20210913
        PARTITION OF ocdetail.usg_billing_detail
        FOR VALUES FROM ('2021-09-12 00:00:00') TO ('2021-09-13 00:00:00');


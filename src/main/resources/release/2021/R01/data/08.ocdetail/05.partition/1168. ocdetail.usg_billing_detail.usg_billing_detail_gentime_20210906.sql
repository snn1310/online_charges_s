CREATE TABLE ocdetail.usg_billing_detail_gentime_20210906
        PARTITION OF ocdetail.usg_billing_detail
        FOR VALUES FROM ('2021-09-05 00:00:00') TO ('2021-09-06 00:00:00');


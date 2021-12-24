CREATE TABLE ocdetail.usg_billing_detail_gentime_20210912
        PARTITION OF ocdetail.usg_billing_detail
        FOR VALUES FROM ('2021-09-11 00:00:00') TO ('2021-09-12 00:00:00');


CREATE TABLE ocdetail.customer_detail_gentime_20210922
        PARTITION OF ocdetail.customer_detail
        FOR VALUES FROM ('2021-09-21 00:00:00') TO ('2021-09-22 00:00:00');


CREATE TABLE ocdetail.customer_detail_gentime_20210826
        PARTITION OF ocdetail.customer_detail
        FOR VALUES FROM ('2021-08-25 00:00:00') TO ('2021-08-26 00:00:00');


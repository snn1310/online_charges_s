CREATE TABLE ocdetail.discount_detail_gentime_20210909
        PARTITION OF ocdetail.discount_detail
        FOR VALUES FROM ('2021-09-08 00:00:00') TO ('2021-09-09 00:00:00');


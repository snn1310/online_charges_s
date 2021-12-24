CREATE TABLE ocdetail.discount_detail_gentime_20210924
        PARTITION OF ocdetail.discount_detail
        FOR VALUES FROM ('2021-09-23 00:00:00') TO ('2021-09-24 00:00:00');


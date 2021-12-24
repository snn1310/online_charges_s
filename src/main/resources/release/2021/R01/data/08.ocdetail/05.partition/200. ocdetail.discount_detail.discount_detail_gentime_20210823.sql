CREATE TABLE ocdetail.discount_detail_gentime_20210823
        PARTITION OF ocdetail.discount_detail
        FOR VALUES FROM ('2021-08-22 00:00:00') TO ('2021-08-23 00:00:00');


CREATE TABLE ocdetail.discount_detail_gentime_20210829
        PARTITION OF ocdetail.discount_detail
        FOR VALUES FROM ('2021-08-28 00:00:00') TO ('2021-08-29 00:00:00');


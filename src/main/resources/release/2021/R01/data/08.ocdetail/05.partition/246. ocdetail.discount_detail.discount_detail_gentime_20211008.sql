CREATE TABLE ocdetail.discount_detail_gentime_20211008
        PARTITION OF ocdetail.discount_detail
        FOR VALUES FROM ('2021-10-07 00:00:00') TO ('2021-10-08 00:00:00');


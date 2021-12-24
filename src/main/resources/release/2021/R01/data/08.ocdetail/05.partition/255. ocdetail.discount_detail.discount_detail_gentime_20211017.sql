CREATE TABLE ocdetail.discount_detail_gentime_20211017
        PARTITION OF ocdetail.discount_detail
        FOR VALUES FROM ('2021-10-16 00:00:00') TO ('2021-10-17 00:00:00');


CREATE TABLE ocdetail.discount_detail_gentime_20210816
        PARTITION OF ocdetail.discount_detail
        FOR VALUES FROM ('2021-08-15 00:00:00') TO ('2021-08-16 00:00:00');


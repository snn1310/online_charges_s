CREATE TABLE ocdetail.warn_promo_gentime_20210823
        PARTITION OF ocdetail.warn_promo
        FOR VALUES FROM ('2021-08-22 00:00:00') TO ('2021-08-23 00:00:00');


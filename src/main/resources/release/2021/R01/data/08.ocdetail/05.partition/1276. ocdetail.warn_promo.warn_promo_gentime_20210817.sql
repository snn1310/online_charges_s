CREATE TABLE ocdetail.warn_promo_gentime_20210817
        PARTITION OF ocdetail.warn_promo
        FOR VALUES FROM ('2021-08-16 00:00:00') TO ('2021-08-17 00:00:00');


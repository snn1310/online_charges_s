CREATE TABLE ocdetail.warn_promo_gentime_20211008
        PARTITION OF ocdetail.warn_promo
        FOR VALUES FROM ('2021-10-07 00:00:00') TO ('2021-10-08 00:00:00');


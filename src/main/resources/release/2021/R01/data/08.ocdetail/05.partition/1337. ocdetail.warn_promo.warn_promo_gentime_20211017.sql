CREATE TABLE ocdetail.warn_promo_gentime_20211017
        PARTITION OF ocdetail.warn_promo
        FOR VALUES FROM ('2021-10-16 00:00:00') TO ('2021-10-17 00:00:00');


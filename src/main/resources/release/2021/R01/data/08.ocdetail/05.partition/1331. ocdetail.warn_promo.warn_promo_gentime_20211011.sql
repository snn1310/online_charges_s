CREATE TABLE ocdetail.warn_promo_gentime_20211011
        PARTITION OF ocdetail.warn_promo
        FOR VALUES FROM ('2021-10-10 00:00:00') TO ('2021-10-11 00:00:00');


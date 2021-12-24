CREATE TABLE ocdetail.warn_promo_gentime_20211007
        PARTITION OF ocdetail.warn_promo
        FOR VALUES FROM ('2021-10-06 00:00:00') TO ('2021-10-07 00:00:00');


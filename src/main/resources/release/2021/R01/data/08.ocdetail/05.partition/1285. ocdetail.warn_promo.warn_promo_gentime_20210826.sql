CREATE TABLE ocdetail.warn_promo_gentime_20210826
        PARTITION OF ocdetail.warn_promo
        FOR VALUES FROM ('2021-08-25 00:00:00') TO ('2021-08-26 00:00:00');


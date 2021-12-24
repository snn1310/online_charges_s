CREATE TABLE ocdetail.warn_promo_gentime_20210908
        PARTITION OF ocdetail.warn_promo
        FOR VALUES FROM ('2021-09-07 00:00:00') TO ('2021-09-08 00:00:00');


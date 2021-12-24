CREATE TABLE ocdetail.warn_promo_gentime_20210829
        PARTITION OF ocdetail.warn_promo
        FOR VALUES FROM ('2021-08-28 00:00:00') TO ('2021-08-29 00:00:00');


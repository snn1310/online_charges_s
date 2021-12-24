CREATE TABLE ocdetail.warn_promo_gentime_20210929
        PARTITION OF ocdetail.warn_promo
        FOR VALUES FROM ('2021-09-28 00:00:00') TO ('2021-09-29 00:00:00');


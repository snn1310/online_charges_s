CREATE TABLE ocdetail.warn_promo_gentime_20210906
        PARTITION OF ocdetail.warn_promo
        FOR VALUES FROM ('2021-09-05 00:00:00') TO ('2021-09-06 00:00:00');


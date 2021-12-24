CREATE TABLE ocdetail.warn_promo_gentime_20210904
        PARTITION OF ocdetail.warn_promo
        FOR VALUES FROM ('2021-09-03 00:00:00') TO ('2021-09-04 00:00:00');


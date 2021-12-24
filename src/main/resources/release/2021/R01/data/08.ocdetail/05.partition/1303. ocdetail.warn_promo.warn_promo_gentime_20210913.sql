CREATE TABLE ocdetail.warn_promo_gentime_20210913
        PARTITION OF ocdetail.warn_promo
        FOR VALUES FROM ('2021-09-12 00:00:00') TO ('2021-09-13 00:00:00');


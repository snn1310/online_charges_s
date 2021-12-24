CREATE TABLE ocdetail.warn_promo_gentime_20210831
        PARTITION OF ocdetail.warn_promo
        FOR VALUES FROM ('2021-08-30 00:00:00') TO ('2021-08-31 00:00:00');


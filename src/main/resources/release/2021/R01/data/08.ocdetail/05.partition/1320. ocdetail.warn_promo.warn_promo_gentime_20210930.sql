CREATE TABLE ocdetail.warn_promo_gentime_20210930
        PARTITION OF ocdetail.warn_promo
        FOR VALUES FROM ('2021-09-29 00:00:00') TO ('2021-09-30 00:00:00');


CREATE TABLE ocdetail.warn_promo_gentime_20210820
        PARTITION OF ocdetail.warn_promo
        FOR VALUES FROM ('2021-08-19 00:00:00') TO ('2021-08-20 00:00:00');


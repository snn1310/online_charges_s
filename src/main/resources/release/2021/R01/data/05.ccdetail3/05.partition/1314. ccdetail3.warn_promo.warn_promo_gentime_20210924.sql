CREATE TABLE ccdetail3.warn_promo_gentime_20210924
        PARTITION OF ccdetail3.warn_promo
        FOR VALUES FROM ('2021-09-23 00:00:00') TO ('2021-09-24 00:00:00');


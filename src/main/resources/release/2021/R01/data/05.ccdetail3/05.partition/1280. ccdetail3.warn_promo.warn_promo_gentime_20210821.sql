CREATE TABLE ccdetail3.warn_promo_gentime_20210821
        PARTITION OF ccdetail3.warn_promo
        FOR VALUES FROM ('2021-08-20 00:00:00') TO ('2021-08-21 00:00:00');


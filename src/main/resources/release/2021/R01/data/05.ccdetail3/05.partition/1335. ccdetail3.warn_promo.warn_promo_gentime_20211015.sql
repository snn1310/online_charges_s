CREATE TABLE ccdetail3.warn_promo_gentime_20211015
        PARTITION OF ccdetail3.warn_promo
        FOR VALUES FROM ('2021-10-14 00:00:00') TO ('2021-10-15 00:00:00');


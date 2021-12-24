CREATE TABLE ccdetail3.warn_promo_gentime_20210828
        PARTITION OF ccdetail3.warn_promo
        FOR VALUES FROM ('2021-08-27 00:00:00') TO ('2021-08-28 00:00:00');


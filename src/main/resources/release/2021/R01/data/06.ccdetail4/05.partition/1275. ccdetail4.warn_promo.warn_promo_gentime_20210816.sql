CREATE TABLE ccdetail4.warn_promo_gentime_20210816
        PARTITION OF ccdetail4.warn_promo
        FOR VALUES FROM ('2021-08-15 00:00:00') TO ('2021-08-16 00:00:00');


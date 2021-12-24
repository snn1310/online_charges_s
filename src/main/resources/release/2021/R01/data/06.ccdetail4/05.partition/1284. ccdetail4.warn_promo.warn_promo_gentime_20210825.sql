CREATE TABLE ccdetail4.warn_promo_gentime_20210825
        PARTITION OF ccdetail4.warn_promo
        FOR VALUES FROM ('2021-08-24 00:00:00') TO ('2021-08-25 00:00:00');


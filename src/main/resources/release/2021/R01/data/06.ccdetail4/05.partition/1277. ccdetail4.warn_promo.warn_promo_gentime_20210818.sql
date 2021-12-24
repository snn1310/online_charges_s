CREATE TABLE ccdetail4.warn_promo_gentime_20210818
        PARTITION OF ccdetail4.warn_promo
        FOR VALUES FROM ('2021-08-17 00:00:00') TO ('2021-08-18 00:00:00');


CREATE TABLE ccdetail4.warn_promo_gentime_20210827
        PARTITION OF ccdetail4.warn_promo
        FOR VALUES FROM ('2021-08-26 00:00:00') TO ('2021-08-27 00:00:00');


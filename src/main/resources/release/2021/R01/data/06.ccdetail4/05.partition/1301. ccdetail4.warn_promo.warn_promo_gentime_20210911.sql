CREATE TABLE ccdetail4.warn_promo_gentime_20210911
        PARTITION OF ccdetail4.warn_promo
        FOR VALUES FROM ('2021-09-10 00:00:00') TO ('2021-09-11 00:00:00');


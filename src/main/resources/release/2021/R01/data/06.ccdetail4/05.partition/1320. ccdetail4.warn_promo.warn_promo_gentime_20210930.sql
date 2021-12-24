CREATE TABLE ccdetail4.warn_promo_gentime_20210930
        PARTITION OF ccdetail4.warn_promo
        FOR VALUES FROM ('2021-09-29 00:00:00') TO ('2021-09-30 00:00:00');


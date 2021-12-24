CREATE TABLE ccdetail4.warn_promo_gentime_20210904
        PARTITION OF ccdetail4.warn_promo
        FOR VALUES FROM ('2021-09-03 00:00:00') TO ('2021-09-04 00:00:00');


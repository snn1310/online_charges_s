CREATE TABLE ccdetail4.warn_promo_gentime_20211014
        PARTITION OF ccdetail4.warn_promo
        FOR VALUES FROM ('2021-10-13 00:00:00') TO ('2021-10-14 00:00:00');


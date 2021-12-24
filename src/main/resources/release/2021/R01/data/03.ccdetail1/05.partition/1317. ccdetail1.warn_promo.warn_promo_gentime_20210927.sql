CREATE TABLE ccdetail1.warn_promo_gentime_20210927
        PARTITION OF ccdetail1.warn_promo
        FOR VALUES FROM ('2021-09-26 00:00:00') TO ('2021-09-27 00:00:00');


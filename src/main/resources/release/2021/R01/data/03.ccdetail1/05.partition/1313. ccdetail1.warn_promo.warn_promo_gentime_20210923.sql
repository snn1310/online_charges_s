CREATE TABLE ccdetail1.warn_promo_gentime_20210923
        PARTITION OF ccdetail1.warn_promo
        FOR VALUES FROM ('2021-09-22 00:00:00') TO ('2021-09-23 00:00:00');


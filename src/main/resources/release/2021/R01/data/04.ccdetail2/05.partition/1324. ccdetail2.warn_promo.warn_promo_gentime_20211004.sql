CREATE TABLE ccdetail2.warn_promo_gentime_20211004
        PARTITION OF ccdetail2.warn_promo
        FOR VALUES FROM ('2021-10-03 00:00:00') TO ('2021-10-04 00:00:00');


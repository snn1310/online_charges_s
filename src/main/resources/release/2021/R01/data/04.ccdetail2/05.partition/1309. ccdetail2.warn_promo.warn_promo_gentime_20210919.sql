CREATE TABLE ccdetail2.warn_promo_gentime_20210919
        PARTITION OF ccdetail2.warn_promo
        FOR VALUES FROM ('2021-09-18 00:00:00') TO ('2021-09-19 00:00:00');


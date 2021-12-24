CREATE TABLE ccdetail2.warn_promo_gentime_20210820
        PARTITION OF ccdetail2.warn_promo
        FOR VALUES FROM ('2021-08-19 00:00:00') TO ('2021-08-20 00:00:00');


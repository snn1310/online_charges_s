CREATE TABLE ccdetail4.warn_promo_gentime_20210815
        PARTITION OF ccdetail4.warn_promo
        FOR VALUES FROM (MINVALUE) TO ('2021-08-15 00:00:00');


CREATE TABLE ocdetail.warn_promo_gentime_20210925
        PARTITION OF ocdetail.warn_promo
        FOR VALUES FROM ('2021-09-24 00:00:00') TO ('2021-09-25 00:00:00');


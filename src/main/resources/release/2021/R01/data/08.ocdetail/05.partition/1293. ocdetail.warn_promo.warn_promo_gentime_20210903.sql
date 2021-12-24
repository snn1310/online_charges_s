CREATE TABLE ocdetail.warn_promo_gentime_20210903
        PARTITION OF ocdetail.warn_promo
        FOR VALUES FROM ('2021-09-02 00:00:00') TO ('2021-09-03 00:00:00');


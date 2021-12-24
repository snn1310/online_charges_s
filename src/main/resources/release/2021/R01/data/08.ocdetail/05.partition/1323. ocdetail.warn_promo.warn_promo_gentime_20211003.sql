CREATE TABLE ocdetail.warn_promo_gentime_20211003
        PARTITION OF ocdetail.warn_promo
        FOR VALUES FROM ('2021-10-02 00:00:00') TO ('2021-10-03 00:00:00');


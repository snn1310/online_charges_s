CREATE TABLE ocdetail.warn_gentime_20211008
        PARTITION OF ocdetail.warn
        FOR VALUES FROM ('2021-10-07 00:00:00') TO ('2021-10-08 00:00:00');


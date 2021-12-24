CREATE TABLE ocdetail.time_royalty_gentime_20211008
        PARTITION OF ocdetail.time_royalty
        FOR VALUES FROM ('2021-10-07 00:00:00') TO ('2021-10-08 00:00:00');


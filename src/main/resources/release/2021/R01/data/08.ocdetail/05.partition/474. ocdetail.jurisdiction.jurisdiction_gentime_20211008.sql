CREATE TABLE ocdetail.jurisdiction_gentime_20211008
        PARTITION OF ocdetail.jurisdiction
        FOR VALUES FROM ('2021-10-07 00:00:00') TO ('2021-10-08 00:00:00');


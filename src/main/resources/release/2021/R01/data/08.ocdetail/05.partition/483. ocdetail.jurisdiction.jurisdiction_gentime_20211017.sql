CREATE TABLE ocdetail.jurisdiction_gentime_20211017
        PARTITION OF ocdetail.jurisdiction
        FOR VALUES FROM ('2021-10-16 00:00:00') TO ('2021-10-17 00:00:00');


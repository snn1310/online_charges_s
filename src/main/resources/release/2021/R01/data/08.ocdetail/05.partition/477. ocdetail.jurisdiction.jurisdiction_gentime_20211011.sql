CREATE TABLE ocdetail.jurisdiction_gentime_20211011
        PARTITION OF ocdetail.jurisdiction
        FOR VALUES FROM ('2021-10-10 00:00:00') TO ('2021-10-11 00:00:00');


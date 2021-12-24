CREATE TABLE ocdetail.jurisdiction_gentime_20211007
        PARTITION OF ocdetail.jurisdiction
        FOR VALUES FROM ('2021-10-06 00:00:00') TO ('2021-10-07 00:00:00');


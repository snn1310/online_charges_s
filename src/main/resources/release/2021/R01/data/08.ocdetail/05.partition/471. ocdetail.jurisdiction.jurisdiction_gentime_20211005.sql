CREATE TABLE ocdetail.jurisdiction_gentime_20211005
        PARTITION OF ocdetail.jurisdiction
        FOR VALUES FROM ('2021-10-04 00:00:00') TO ('2021-10-05 00:00:00');


CREATE TABLE ocdetail.jurisdiction_gentime_20210823
        PARTITION OF ocdetail.jurisdiction
        FOR VALUES FROM ('2021-08-22 00:00:00') TO ('2021-08-23 00:00:00');


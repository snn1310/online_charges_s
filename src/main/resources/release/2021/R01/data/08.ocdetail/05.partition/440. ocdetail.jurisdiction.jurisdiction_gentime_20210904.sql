CREATE TABLE ocdetail.jurisdiction_gentime_20210904
        PARTITION OF ocdetail.jurisdiction
        FOR VALUES FROM ('2021-09-03 00:00:00') TO ('2021-09-04 00:00:00');


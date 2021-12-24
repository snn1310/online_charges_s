CREATE TABLE ocdetail.jurisdiction_gentime_20210822
        PARTITION OF ocdetail.jurisdiction
        FOR VALUES FROM ('2021-08-21 00:00:00') TO ('2021-08-22 00:00:00');


CREATE TABLE ocdetail.jurisdiction_gentime_20210827
        PARTITION OF ocdetail.jurisdiction
        FOR VALUES FROM ('2021-08-26 00:00:00') TO ('2021-08-27 00:00:00');


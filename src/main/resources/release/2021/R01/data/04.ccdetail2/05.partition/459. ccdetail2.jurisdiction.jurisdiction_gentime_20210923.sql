CREATE TABLE ccdetail2.jurisdiction_gentime_20210923
        PARTITION OF ccdetail2.jurisdiction
        FOR VALUES FROM ('2021-09-22 00:00:00') TO ('2021-09-23 00:00:00');


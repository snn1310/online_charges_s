CREATE TABLE ccdetail3.jurisdiction_gentime_20211004
        PARTITION OF ccdetail3.jurisdiction
        FOR VALUES FROM ('2021-10-03 00:00:00') TO ('2021-10-04 00:00:00');


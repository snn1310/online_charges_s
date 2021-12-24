CREATE TABLE ccdetail3.jurisdiction_gentime_20210918
        PARTITION OF ccdetail3.jurisdiction
        FOR VALUES FROM ('2021-09-17 00:00:00') TO ('2021-09-18 00:00:00');


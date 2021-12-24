CREATE TABLE ccdetail3.jurisdiction_gentime_20211006
        PARTITION OF ccdetail3.jurisdiction
        FOR VALUES FROM ('2021-10-05 00:00:00') TO ('2021-10-06 00:00:00');


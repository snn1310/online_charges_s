CREATE TABLE ccdetail1.jurisdiction_gentime_20211011
        PARTITION OF ccdetail1.jurisdiction
        FOR VALUES FROM ('2021-10-10 00:00:00') TO ('2021-10-11 00:00:00');


CREATE TABLE ccdetail1.jurisdiction_gentime_20211015
        PARTITION OF ccdetail1.jurisdiction
        FOR VALUES FROM ('2021-10-14 00:00:00') TO ('2021-10-15 00:00:00');


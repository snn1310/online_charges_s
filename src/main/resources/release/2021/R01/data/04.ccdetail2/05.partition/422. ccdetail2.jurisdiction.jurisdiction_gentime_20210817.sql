CREATE TABLE ccdetail2.jurisdiction_gentime_20210817
        PARTITION OF ccdetail2.jurisdiction
        FOR VALUES FROM ('2021-08-16 00:00:00') TO ('2021-08-17 00:00:00');


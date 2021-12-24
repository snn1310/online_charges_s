CREATE TABLE ccdetail2.jurisdiction_gentime_20210821
        PARTITION OF ccdetail2.jurisdiction
        FOR VALUES FROM ('2021-08-20 00:00:00') TO ('2021-08-21 00:00:00');


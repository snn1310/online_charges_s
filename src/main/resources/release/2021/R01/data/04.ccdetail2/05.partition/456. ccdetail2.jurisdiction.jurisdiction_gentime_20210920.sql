CREATE TABLE ccdetail2.jurisdiction_gentime_20210920
        PARTITION OF ccdetail2.jurisdiction
        FOR VALUES FROM ('2021-09-19 00:00:00') TO ('2021-09-20 00:00:00');


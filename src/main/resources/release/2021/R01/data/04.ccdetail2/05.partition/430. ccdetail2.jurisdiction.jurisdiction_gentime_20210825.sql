CREATE TABLE ccdetail2.jurisdiction_gentime_20210825
        PARTITION OF ccdetail2.jurisdiction
        FOR VALUES FROM ('2021-08-24 00:00:00') TO ('2021-08-25 00:00:00');


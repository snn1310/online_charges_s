CREATE TABLE ccdetail2.jurisdiction_gentime_20210929
        PARTITION OF ccdetail2.jurisdiction
        FOR VALUES FROM ('2021-09-28 00:00:00') TO ('2021-09-29 00:00:00');


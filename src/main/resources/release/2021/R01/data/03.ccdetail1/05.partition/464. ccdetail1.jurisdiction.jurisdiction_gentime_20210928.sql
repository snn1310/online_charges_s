CREATE TABLE ccdetail1.jurisdiction_gentime_20210928
        PARTITION OF ccdetail1.jurisdiction
        FOR VALUES FROM ('2021-09-27 00:00:00') TO ('2021-09-28 00:00:00');


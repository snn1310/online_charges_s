CREATE TABLE ccdetail1.jurisdiction_gentime_20210912
        PARTITION OF ccdetail1.jurisdiction
        FOR VALUES FROM ('2021-09-11 00:00:00') TO ('2021-09-12 00:00:00');


CREATE TABLE ccdetail3.jurisdiction_gentime_20210906
        PARTITION OF ccdetail3.jurisdiction
        FOR VALUES FROM ('2021-09-05 00:00:00') TO ('2021-09-06 00:00:00');

CREATE TABLE ccdetail1.jurisdiction_gentime_20210827
        PARTITION OF ccdetail1.jurisdiction
        FOR VALUES FROM ('2021-08-26 00:00:00') TO ('2021-08-27 00:00:00');

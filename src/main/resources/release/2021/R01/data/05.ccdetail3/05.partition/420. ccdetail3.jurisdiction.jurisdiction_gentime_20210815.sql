CREATE TABLE ccdetail3.jurisdiction_gentime_20210815
        PARTITION OF ccdetail3.jurisdiction
        FOR VALUES FROM (MINVALUE) TO ('2021-08-15 00:00:00');


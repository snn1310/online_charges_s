CREATE TABLE ccdetail1.jurisdiction_gentime_20210815
        PARTITION OF ccdetail1.jurisdiction
        FOR VALUES FROM (MINVALUE) TO ('2021-08-15 00:00:00');


CREATE TABLE ccdetail1.gateway_royalty_gentime_20211001
        PARTITION OF ccdetail1.gateway_royalty
        FOR VALUES FROM ('2021-09-30 00:00:00') TO ('2021-10-01 00:00:00');


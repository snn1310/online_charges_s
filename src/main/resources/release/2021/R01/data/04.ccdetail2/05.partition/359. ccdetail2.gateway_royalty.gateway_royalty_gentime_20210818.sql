CREATE TABLE ccdetail2.gateway_royalty_gentime_20210818
        PARTITION OF ccdetail2.gateway_royalty
        FOR VALUES FROM ('2021-08-17 00:00:00') TO ('2021-08-18 00:00:00');


CREATE TABLE ccdetail1.gateway_royalty_gentime_20210819
        PARTITION OF ccdetail1.gateway_royalty
        FOR VALUES FROM ('2021-08-18 00:00:00') TO ('2021-08-19 00:00:00');


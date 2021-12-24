CREATE TABLE ccdetail3.gateway_royalty_gentime_20210823
        PARTITION OF ccdetail3.gateway_royalty
        FOR VALUES FROM ('2021-08-22 00:00:00') TO ('2021-08-23 00:00:00');


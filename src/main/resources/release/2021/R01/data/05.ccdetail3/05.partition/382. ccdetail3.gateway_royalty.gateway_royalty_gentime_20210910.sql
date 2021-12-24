CREATE TABLE ccdetail3.gateway_royalty_gentime_20210910
        PARTITION OF ccdetail3.gateway_royalty
        FOR VALUES FROM ('2021-09-09 00:00:00') TO ('2021-09-10 00:00:00');


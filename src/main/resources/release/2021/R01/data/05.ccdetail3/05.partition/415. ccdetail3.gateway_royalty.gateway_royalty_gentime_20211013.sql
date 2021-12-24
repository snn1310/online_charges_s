CREATE TABLE ccdetail3.gateway_royalty_gentime_20211013
        PARTITION OF ccdetail3.gateway_royalty
        FOR VALUES FROM ('2021-10-12 00:00:00') TO ('2021-10-13 00:00:00');


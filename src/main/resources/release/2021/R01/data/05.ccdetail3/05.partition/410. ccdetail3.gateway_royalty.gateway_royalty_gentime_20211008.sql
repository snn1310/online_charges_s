CREATE TABLE ccdetail3.gateway_royalty_gentime_20211008
        PARTITION OF ccdetail3.gateway_royalty
        FOR VALUES FROM ('2021-10-07 00:00:00') TO ('2021-10-08 00:00:00');


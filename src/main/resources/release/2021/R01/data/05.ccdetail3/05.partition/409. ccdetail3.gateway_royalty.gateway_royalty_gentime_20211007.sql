CREATE TABLE ccdetail3.gateway_royalty_gentime_20211007
        PARTITION OF ccdetail3.gateway_royalty
        FOR VALUES FROM ('2021-10-06 00:00:00') TO ('2021-10-07 00:00:00');


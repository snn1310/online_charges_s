CREATE TABLE ccdetail3.gateway_royalty_gentime_20211006
        PARTITION OF ccdetail3.gateway_royalty
        FOR VALUES FROM ('2021-10-05 00:00:00') TO ('2021-10-06 00:00:00');


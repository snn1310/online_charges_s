CREATE TABLE ccdetail3.gateway_royalty_gentime_20210906
        PARTITION OF ccdetail3.gateway_royalty
        FOR VALUES FROM ('2021-09-05 00:00:00') TO ('2021-09-06 00:00:00');


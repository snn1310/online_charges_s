CREATE TABLE ccdetail1.gateway_royalty_gentime_20210918
        PARTITION OF ccdetail1.gateway_royalty
        FOR VALUES FROM ('2021-09-17 00:00:00') TO ('2021-09-18 00:00:00');


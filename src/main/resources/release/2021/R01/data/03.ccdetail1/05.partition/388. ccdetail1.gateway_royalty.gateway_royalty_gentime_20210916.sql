CREATE TABLE ccdetail1.gateway_royalty_gentime_20210916
        PARTITION OF ccdetail1.gateway_royalty
        FOR VALUES FROM ('2021-09-15 00:00:00') TO ('2021-09-16 00:00:00');


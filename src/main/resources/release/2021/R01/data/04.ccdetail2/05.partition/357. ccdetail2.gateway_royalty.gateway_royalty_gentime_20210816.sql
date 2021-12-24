CREATE TABLE ccdetail2.gateway_royalty_gentime_20210816
        PARTITION OF ccdetail2.gateway_royalty
        FOR VALUES FROM ('2021-08-15 00:00:00') TO ('2021-08-16 00:00:00');


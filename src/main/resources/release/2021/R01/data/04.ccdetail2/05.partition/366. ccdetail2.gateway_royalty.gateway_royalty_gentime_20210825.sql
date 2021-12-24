CREATE TABLE ccdetail2.gateway_royalty_gentime_20210825
        PARTITION OF ccdetail2.gateway_royalty
        FOR VALUES FROM ('2021-08-24 00:00:00') TO ('2021-08-25 00:00:00');


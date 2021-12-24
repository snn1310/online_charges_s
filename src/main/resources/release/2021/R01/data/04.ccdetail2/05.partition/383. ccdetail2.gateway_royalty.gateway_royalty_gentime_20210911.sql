CREATE TABLE ccdetail2.gateway_royalty_gentime_20210911
        PARTITION OF ccdetail2.gateway_royalty
        FOR VALUES FROM ('2021-09-10 00:00:00') TO ('2021-09-11 00:00:00');


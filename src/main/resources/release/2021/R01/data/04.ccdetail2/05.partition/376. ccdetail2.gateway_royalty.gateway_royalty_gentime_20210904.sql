CREATE TABLE ccdetail2.gateway_royalty_gentime_20210904
        PARTITION OF ccdetail2.gateway_royalty
        FOR VALUES FROM ('2021-09-03 00:00:00') TO ('2021-09-04 00:00:00');


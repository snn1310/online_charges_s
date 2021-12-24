CREATE TABLE ccdetail1.gateway_royalty_gentime_20210907
        PARTITION OF ccdetail1.gateway_royalty
        FOR VALUES FROM ('2021-09-06 00:00:00') TO ('2021-09-07 00:00:00');


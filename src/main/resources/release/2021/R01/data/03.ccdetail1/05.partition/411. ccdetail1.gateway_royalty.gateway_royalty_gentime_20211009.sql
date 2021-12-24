CREATE TABLE ccdetail1.gateway_royalty_gentime_20211009
        PARTITION OF ccdetail1.gateway_royalty
        FOR VALUES FROM ('2021-10-08 00:00:00') TO ('2021-10-09 00:00:00');


CREATE TABLE ccdetail4.gateway_royalty_gentime_20210824
        PARTITION OF ccdetail4.gateway_royalty
        FOR VALUES FROM ('2021-08-23 00:00:00') TO ('2021-08-24 00:00:00');


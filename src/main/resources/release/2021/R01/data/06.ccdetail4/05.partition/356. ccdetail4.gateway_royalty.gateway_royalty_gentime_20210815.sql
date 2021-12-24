CREATE TABLE ccdetail4.gateway_royalty_gentime_20210815
        PARTITION OF ccdetail4.gateway_royalty
        FOR VALUES FROM (MINVALUE) TO ('2021-08-15 00:00:00');


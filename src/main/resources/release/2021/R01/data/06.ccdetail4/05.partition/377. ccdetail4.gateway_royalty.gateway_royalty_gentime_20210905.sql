CREATE TABLE ccdetail4.gateway_royalty_gentime_20210905
        PARTITION OF ccdetail4.gateway_royalty
        FOR VALUES FROM ('2021-09-04 00:00:00') TO ('2021-09-05 00:00:00');


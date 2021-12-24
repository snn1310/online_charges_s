CREATE TABLE ocdetail.gateway_royalty_gentime_20210908
        PARTITION OF ocdetail.gateway_royalty
        FOR VALUES FROM ('2021-09-07 00:00:00') TO ('2021-09-08 00:00:00');


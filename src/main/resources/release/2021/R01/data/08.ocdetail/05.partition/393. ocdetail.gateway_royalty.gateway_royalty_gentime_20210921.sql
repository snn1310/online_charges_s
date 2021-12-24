CREATE TABLE ocdetail.gateway_royalty_gentime_20210921
        PARTITION OF ocdetail.gateway_royalty
        FOR VALUES FROM ('2021-09-20 00:00:00') TO ('2021-09-21 00:00:00');


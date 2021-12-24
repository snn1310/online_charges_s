CREATE TABLE ocdetail.gateway_royalty_gentime_20210821
        PARTITION OF ocdetail.gateway_royalty
        FOR VALUES FROM ('2021-08-20 00:00:00') TO ('2021-08-21 00:00:00');


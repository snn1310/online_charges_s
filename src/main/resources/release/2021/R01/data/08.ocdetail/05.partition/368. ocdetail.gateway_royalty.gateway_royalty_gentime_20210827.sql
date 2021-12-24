CREATE TABLE ocdetail.gateway_royalty_gentime_20210827
        PARTITION OF ocdetail.gateway_royalty
        FOR VALUES FROM ('2021-08-26 00:00:00') TO ('2021-08-27 00:00:00');


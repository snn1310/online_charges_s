CREATE TABLE ocdetail.gateway_royalty_gentime_20211012
        PARTITION OF ocdetail.gateway_royalty
        FOR VALUES FROM ('2021-10-11 00:00:00') TO ('2021-10-12 00:00:00');

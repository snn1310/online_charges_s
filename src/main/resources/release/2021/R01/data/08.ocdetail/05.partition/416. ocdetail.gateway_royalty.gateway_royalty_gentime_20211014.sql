CREATE TABLE ocdetail.gateway_royalty_gentime_20211014
        PARTITION OF ocdetail.gateway_royalty
        FOR VALUES FROM ('2021-10-13 00:00:00') TO ('2021-10-14 00:00:00');


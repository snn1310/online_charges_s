CREATE TABLE ocdetail.gateway_royalty_gentime_20210815
        PARTITION OF ocdetail.gateway_royalty
        FOR VALUES FROM (MINVALUE) TO ('2021-08-15 00:00:00');


CREATE TABLE ccdetail2.gateway_royalty_gentime_20210913
        PARTITION OF ccdetail2.gateway_royalty
        FOR VALUES FROM ('2021-09-12 00:00:00') TO ('2021-09-13 00:00:00');


CREATE TABLE ocdetail.time_royalty_gentime_20210818
        PARTITION OF ocdetail.time_royalty
        FOR VALUES FROM ('2021-08-17 00:00:00') TO ('2021-08-18 00:00:00');


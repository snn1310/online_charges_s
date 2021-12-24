CREATE TABLE ocdetail.time_royalty_gentime_20210923
        PARTITION OF ocdetail.time_royalty
        FOR VALUES FROM ('2021-09-22 00:00:00') TO ('2021-09-23 00:00:00');


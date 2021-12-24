CREATE TABLE ocdetail.time_royalty_gentime_20210822
        PARTITION OF ocdetail.time_royalty
        FOR VALUES FROM ('2021-08-21 00:00:00') TO ('2021-08-22 00:00:00');


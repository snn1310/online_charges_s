CREATE TABLE ocdetail.time_royalty_gentime_20210827
        PARTITION OF ocdetail.time_royalty
        FOR VALUES FROM ('2021-08-26 00:00:00') TO ('2021-08-27 00:00:00');


CREATE TABLE ocdetail.time_royalty_gentime_20210914
        PARTITION OF ocdetail.time_royalty
        FOR VALUES FROM ('2021-09-13 00:00:00') TO ('2021-09-14 00:00:00');


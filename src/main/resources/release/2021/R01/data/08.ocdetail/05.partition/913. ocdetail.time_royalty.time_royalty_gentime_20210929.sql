CREATE TABLE ocdetail.time_royalty_gentime_20210929
        PARTITION OF ocdetail.time_royalty
        FOR VALUES FROM ('2021-09-28 00:00:00') TO ('2021-09-29 00:00:00');


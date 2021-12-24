CREATE TABLE ocdetail.time_royalty_gentime_20211003
        PARTITION OF ocdetail.time_royalty
        FOR VALUES FROM ('2021-10-02 00:00:00') TO ('2021-10-03 00:00:00');


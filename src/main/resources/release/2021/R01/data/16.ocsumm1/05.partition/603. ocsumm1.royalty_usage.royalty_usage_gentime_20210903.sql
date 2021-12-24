CREATE TABLE ocsumm1.royalty_usage_gentime_20210903
        PARTITION OF ocsumm1.royalty_usage
        FOR VALUES FROM ('2021-09-02 00:00:00') TO ('2021-09-03 00:00:00');


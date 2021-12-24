CREATE TABLE ocsumm2.usage_gentime_20211003
        PARTITION OF ocsumm2.usage
        FOR VALUES FROM ('2021-10-02 00:00:00') TO ('2021-10-03 00:00:00');


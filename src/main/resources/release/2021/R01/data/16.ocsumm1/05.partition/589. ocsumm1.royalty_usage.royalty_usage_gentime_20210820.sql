CREATE TABLE ocsumm1.royalty_usage_gentime_20210820
        PARTITION OF ocsumm1.royalty_usage
        FOR VALUES FROM ('2021-08-19 00:00:00') TO ('2021-08-20 00:00:00');


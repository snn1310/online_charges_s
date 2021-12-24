CREATE TABLE ocsumm2.royalty_usage_gentime_20210907
        PARTITION OF ocsumm2.royalty_usage
        FOR VALUES FROM ('2021-09-06 00:00:00') TO ('2021-09-07 00:00:00');


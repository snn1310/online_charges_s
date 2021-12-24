CREATE TABLE ocsumm2.royalty_gentime_20210829
        PARTITION OF ocsumm2.royalty
        FOR VALUES FROM ('2021-08-28 00:00:00') TO ('2021-08-29 00:00:00');


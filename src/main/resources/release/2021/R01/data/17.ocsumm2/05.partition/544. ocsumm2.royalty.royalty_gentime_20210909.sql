CREATE TABLE ocsumm2.royalty_gentime_20210909
        PARTITION OF ocsumm2.royalty
        FOR VALUES FROM ('2021-09-08 00:00:00') TO ('2021-09-09 00:00:00');


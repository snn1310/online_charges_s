CREATE TABLE ocsumm2.royalty_gentime_20210915
        PARTITION OF ocsumm2.royalty
        FOR VALUES FROM ('2021-09-14 00:00:00') TO ('2021-09-15 00:00:00');


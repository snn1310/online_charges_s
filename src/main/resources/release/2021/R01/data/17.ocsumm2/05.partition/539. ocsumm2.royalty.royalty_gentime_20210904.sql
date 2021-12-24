CREATE TABLE ocsumm2.royalty_gentime_20210904
        PARTITION OF ocsumm2.royalty
        FOR VALUES FROM ('2021-09-03 00:00:00') TO ('2021-09-04 00:00:00');


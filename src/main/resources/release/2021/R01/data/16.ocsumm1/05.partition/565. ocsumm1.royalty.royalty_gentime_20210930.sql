CREATE TABLE ocsumm1.royalty_gentime_20210930
        PARTITION OF ocsumm1.royalty
        FOR VALUES FROM ('2021-09-29 00:00:00') TO ('2021-09-30 00:00:00');


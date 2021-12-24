CREATE TABLE ocsumm1.royalty_gentime_20211014
        PARTITION OF ocsumm1.royalty
        FOR VALUES FROM ('2021-10-13 00:00:00') TO ('2021-10-14 00:00:00');


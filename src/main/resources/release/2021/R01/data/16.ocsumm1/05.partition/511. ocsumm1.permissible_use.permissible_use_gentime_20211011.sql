CREATE TABLE ocsumm1.permissible_use_gentime_20211011
        PARTITION OF ocsumm1.permissible_use
        FOR VALUES FROM ('2021-10-10 00:00:00') TO ('2021-10-11 00:00:00');


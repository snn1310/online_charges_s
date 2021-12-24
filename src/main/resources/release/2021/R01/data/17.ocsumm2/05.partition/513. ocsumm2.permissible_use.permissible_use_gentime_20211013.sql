CREATE TABLE ocsumm2.permissible_use_gentime_20211013
        PARTITION OF ocsumm2.permissible_use
        FOR VALUES FROM ('2021-10-12 00:00:00') TO ('2021-10-13 00:00:00');


CREATE TABLE ocsumm2.permissible_use_gentime_20211004
        PARTITION OF ocsumm2.permissible_use
        FOR VALUES FROM ('2021-10-03 00:00:00') TO ('2021-10-04 00:00:00');


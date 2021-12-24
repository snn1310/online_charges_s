CREATE TABLE ocsumm2.permissible_use_gentime_20210917
        PARTITION OF ocsumm2.permissible_use
        FOR VALUES FROM ('2021-09-16 00:00:00') TO ('2021-09-17 00:00:00');


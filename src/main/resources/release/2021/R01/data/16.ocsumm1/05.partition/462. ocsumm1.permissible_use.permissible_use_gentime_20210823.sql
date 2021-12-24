CREATE TABLE ocsumm1.permissible_use_gentime_20210823
        PARTITION OF ocsumm1.permissible_use
        FOR VALUES FROM ('2021-08-22 00:00:00') TO ('2021-08-23 00:00:00');


CREATE TABLE ocsumm2.permissible_use_gentime_20210822
        PARTITION OF ocsumm2.permissible_use
        FOR VALUES FROM ('2021-08-21 00:00:00') TO ('2021-08-22 00:00:00');


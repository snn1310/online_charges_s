CREATE TABLE ocsumm2.permissible_use_gentime_20210929
        PARTITION OF ocsumm2.permissible_use
        FOR VALUES FROM ('2021-09-28 00:00:00') TO ('2021-09-29 00:00:00');


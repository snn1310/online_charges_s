CREATE TABLE ocsumm2.permissible_use_gentime_20210926
        PARTITION OF ocsumm2.permissible_use
        FOR VALUES FROM ('2021-09-25 00:00:00') TO ('2021-09-26 00:00:00');


CREATE TABLE ocsumm1.permissible_use_gentime_20210918
        PARTITION OF ocsumm1.permissible_use
        FOR VALUES FROM ('2021-09-17 00:00:00') TO ('2021-09-18 00:00:00');


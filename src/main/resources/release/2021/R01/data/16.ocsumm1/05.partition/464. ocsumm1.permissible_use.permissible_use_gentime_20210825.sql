CREATE TABLE ocsumm1.permissible_use_gentime_20210825
        PARTITION OF ocsumm1.permissible_use
        FOR VALUES FROM ('2021-08-24 00:00:00') TO ('2021-08-25 00:00:00');


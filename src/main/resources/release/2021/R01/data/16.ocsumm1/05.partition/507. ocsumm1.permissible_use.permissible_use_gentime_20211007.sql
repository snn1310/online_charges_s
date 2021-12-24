CREATE TABLE ocsumm1.permissible_use_gentime_20211007
        PARTITION OF ocsumm1.permissible_use
        FOR VALUES FROM ('2021-10-06 00:00:00') TO ('2021-10-07 00:00:00');


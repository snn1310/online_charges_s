CREATE TABLE ocsumm2.permissible_use_gentime_20211018
        PARTITION OF ocsumm2.permissible_use
        FOR VALUES FROM ('2021-10-17 00:00:00') TO ('2021-10-18 00:00:00');


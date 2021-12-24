CREATE TABLE ocsumm2.permissible_use_gentime_20211009
        PARTITION OF ocsumm2.permissible_use
        FOR VALUES FROM ('2021-10-08 00:00:00') TO ('2021-10-09 00:00:00');


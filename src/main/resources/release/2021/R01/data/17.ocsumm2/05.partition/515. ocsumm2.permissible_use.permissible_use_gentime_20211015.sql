CREATE TABLE ocsumm2.permissible_use_gentime_20211015
        PARTITION OF ocsumm2.permissible_use
        FOR VALUES FROM ('2021-10-14 00:00:00') TO ('2021-10-15 00:00:00');


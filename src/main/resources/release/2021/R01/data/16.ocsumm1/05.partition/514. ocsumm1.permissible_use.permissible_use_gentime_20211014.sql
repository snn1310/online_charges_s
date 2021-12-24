CREATE TABLE ocsumm1.permissible_use_gentime_20211014
        PARTITION OF ocsumm1.permissible_use
        FOR VALUES FROM ('2021-10-13 00:00:00') TO ('2021-10-14 00:00:00');


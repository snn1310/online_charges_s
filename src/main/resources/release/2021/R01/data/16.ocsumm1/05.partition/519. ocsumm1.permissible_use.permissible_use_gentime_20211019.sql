CREATE TABLE ocsumm1.permissible_use_gentime_20211019
        PARTITION OF ocsumm1.permissible_use
        FOR VALUES FROM ('2021-10-18 00:00:00') TO ('2021-10-19 00:00:00');


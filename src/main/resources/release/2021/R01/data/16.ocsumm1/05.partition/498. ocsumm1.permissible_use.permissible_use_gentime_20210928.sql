CREATE TABLE ocsumm1.permissible_use_gentime_20210928
        PARTITION OF ocsumm1.permissible_use
        FOR VALUES FROM ('2021-09-27 00:00:00') TO ('2021-09-28 00:00:00');


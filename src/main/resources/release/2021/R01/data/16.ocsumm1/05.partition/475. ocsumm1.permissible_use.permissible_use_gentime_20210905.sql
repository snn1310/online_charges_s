CREATE TABLE ocsumm1.permissible_use_gentime_20210905
        PARTITION OF ocsumm1.permissible_use
        FOR VALUES FROM ('2021-09-04 00:00:00') TO ('2021-09-05 00:00:00');

